<?php
class ControllerModuleHomecat extends Controller {
    public function index() {
        $this->load->language('module/homecat');

        $data['heading_title'] = $this->language->get('heading_title');

        if (isset($this->request->get['path'])) {
            $parts = explode('_', (string)$this->request->get['path']);
        } else {
            $parts = array();
        }

        if (isset($parts[0])) {
            $data['category_id'] = $parts[0];
        } else {
            $data['category_id'] = 0;
        }

        if (isset($parts[1])) {
            $data['child_id'] = $parts[1];
        } else {
            $data['child_id'] = 0;
        }

        $this->load->model('catalog/category');

        $this->load->model('catalog/product');

        $data['categories'] = array();

        $categories = $this->model_catalog_category->getCategories(0);
        //print_r($categories);
        foreach ($categories as $category) {
            $children_data = array();

            if ($category['image']) {
                $category['image'] = '/image/'.$category['image'];
            } else {
                $category['image'] = '/image/no_image.png';
            }
            $category['description'] = htmlspecialchars_decode($category['description']);
            $data['categories'][] = array(
                'category_id' => $category['category_id'],
                'name'        => $category['name'],
                'description' => $category['description'],
                'children'    => $children_data,
                'href'        => $this->url->link('product/category', 'path=' . $category['category_id']),
                'image'       => $category['image']
            );
        }
        
        return $this->load->view('module/homecat', $data);
    }
}