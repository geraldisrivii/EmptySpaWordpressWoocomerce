
export interface Settings {
    cfs: Object,
    [key: string]: any;
}

// store
export interface State {
    
}


export interface ISocials {
    image: string;
    link: string;
}



export interface MenuButtonItem {
    value: string | number;
    label: string;
}

export interface Term {
    term_id: number;
    name: string;
    slug: string;
    [key: string]: any;
}


export interface ApiImage {
    id: number;
    name: string;
    src: string;
    [key: string]: any;
}

export interface IFormForUnregisteredUsers {
    name: string | null,
    tel: string | null,
}