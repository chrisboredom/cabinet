FactoryGirl.define do
  factory :doc do
    user
    title "Resume"
    content "Heirloom migas fam succulents meggings, chia craft beer synth bespoke tacos church-key. Cray gluten-free yuccie bicycle rights, tofu viral iPhone kinfolk ramps. XOXO pug tousled, mumblecore shoreditch +1 pork belly. Drinking vinegar small batch pour-over coloring book. Narwhal you probably haven't heard of them pok pok, asymmetrical banjo marfa quinoa fanny pack."
  end
  factory :second_doc, class: Doc do
    user
    title "Second Post"
    content "Blue bottle thundercats vegan, trust fund glossier butcher craft beer marfa umami retro coloring book 8-bit PBR&B. Retro disrupt squid gastropub etsy. XOXO chambray prism butcher thundercats mlkshk typewriter post-ironic artisan. "
  end
end
