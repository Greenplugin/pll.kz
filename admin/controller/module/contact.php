<?php
class ControllerModuleContact extends Controller {
    private $error = array();

    public function index() {
        $this->load->language('module/contact');

        $this->document->setTitle($this->language->get('heading_title'));

        $this->load->model('module/contact');

        if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
            $this->model_setting_setting->editSetting('contact', $this->request->post);

            $this->session->data['success'] = $this->language->get('text_success');

            $this->response->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], true));
        }

        $data['heading_title'] = $this->language->get('heading_title');

        $data['text_edit'] = $this->language->get('text_edit');
        $data['text_enabled'] = $this->language->get('text_enabled');
        $data['text_disabled'] = $this->language->get('text_disabled');

        $data['entry_status'] = $this->language->get('entry_status');

        $data['button_save'] = $this->language->get('button_save');
        $data['button_cancel'] = $this->language->get('button_cancel');

        if (isset($this->error['warning'])) {
            $data['error_warning'] = $this->error['warning'];
        } else {
            $data['error_warning'] = '';
        }

        $data['breadcrumbs'] = array();

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_home'),
            'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true)
        );

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_module'),
            'href' => $this->url->link('extension/module', 'token=' . $this->session->data['token'], true)
        );

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('heading_title'),
            'href' => $this->url->link('module/contact', 'token=' . $this->session->data['token'], true)
        );

        $data['action'] = $this->url->link('module/contact', 'token=' . $this->session->data['token'], true);

        $data['save_action'] = $this->url->link('module/contact/setcontact', 'token=' . $this->session->data['token'], true);
        $data['delete_action'] = $this->url->link('module/contact/deletecontact', 'token=' . $this->session->data['token'], true);

        $data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], true);

        if (isset($this->request->post['contact_status'])) {
            $data['contact_status'] = $this->request->post['contact_status'];
        } else {
            $data['contact_status'] = $this->config->get('contact_status');
        }

        $data['contacts'] = $this->model_module_contact->getContacts();
        if(isset($data['contacts']['id'])){
            $data['contecats'] = [$data['contacts']];
        }

        $data['header'] = $this->load->controller('common/header');
        $data['column_left'] = $this->load->controller('common/column_left');
        $data['footer'] = $this->load->controller('common/footer');
        $this->response->setOutput($this->load->view('module/contact', $data));
    }

    public function setContact(){
        $this->load->language('module/contact');
        $this->load->model('module/contact');
        $data['status'] = $this->model_module_contact->setContact($this->request->post);
        $this->response->setOutput(json_encode($data));
    }

    public function deleteContact(){
        $this->load->language('module/contact');
        $this->load->model('module/contact');
        $data['status'] = $this->model_module_contact->deleteContact($this->request->get['id']);
        $this->response->setOutput(json_encode($data));
    }

    protected function validate() {
        if (!$this->user->hasPermission('modify', 'module/contact')) {
            $this->error['warning'] = $this->language->get('error_permission');
        }

        return !$this->error;
    }
}