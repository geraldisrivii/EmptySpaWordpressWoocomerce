<?php

use App\Filters\CustomFieldsFilter;
use App\Filters\ProductFilter;
use App\Filters\RestApiFilter;



RestApiFilter::register();
CustomFieldsFilter::register();
ProductFilter::register();