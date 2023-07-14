# lucid-masks
- [preview](https://streamable.com/gid7jj)
- Item based mask script
## Dependencies
 - [qb-core](https://github.com/qbcore-framework/qb-core)

## Installation


## Step 1
* Drag `lucid-masks` into your resources folder or any subfolder
* Make sure that the folder is named `lucid-masks` and NOT `lucid-masks-main`

## Step 2
* Add the following line to your **qb-core/shared/items.lua**
```lua
	['mask']  = {['name'] = 'mask', ['label'] = 'Mask',  ['weight'] = 1,  ['type'] = 'item',  ['image'] = 'mask.png',  ['unique'] = true,  ['useable'] = true,  ['shouldClose'] = true,  ['combinable'] = nil, 	['description'] = ''},

```

## Step 3
* Find the following line in your **qb-radialmenu/config.lua**
```lua
id = 'Mask',
title = 'Mask',
icon = 'masks-theater',
type = 'client',
event = 'qb-radialmenu:ToggleProps',
shouldClose = true
```

* and replace it with :

```lua
id = 'Mask',
title = 'Mask',
icon = 'masks-theater',
type = 'client',
event = 'lucid-masks:client:MaskOff',
shouldClose = true
```

## Step 4
* Find the following line to your **qb-radialmenu/config.lua**
```lua
    ["mask"] = {
        Func = function() ToggleClothing("Mask") end,
        Sprite = "mask",
        Desc = "Take your mask off/on",
        Button = 6,
        Name = "Mask"
    }
```

* and comment it out :

```lua
--id = 'Mask',
--title = 'Mask',
--icon = 'masks-theater',
--type = 'client',
--event = 'lucid-masks:client:MaskOff',
--shouldClose = true
```

## Step 5 (optional) - ps-inventory / lj-inventory
* if you want the item description to have the mask id (https://i.imgur.com/pTkb79k.png)
* find the following function in your **inventory/html/js/app.js**
```lua
function FormatItemInfo(itemData, dom) {
```
* amongst all the elseif's find a place to insert the following
```lua
}else if (itemData.name == "mask") {
    $(".item-info-title").html("<p>" + `${itemData.info.label|| itemData.label}` + "</p>");
    $(".item-info-description").html(
        "<p>" + itemData.info.drawableId + "-" + itemData.info.textureId + "</p>"
    );
```
* example (https://i.imgur.com/gMWEsXd.png)

## Installation Complete
* restart your server
* do not spawn in the mask item using a menu as it will have no store data, go to a clothing store or something
* enjoy!