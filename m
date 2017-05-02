From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 02 May 2017 09:29:09 +0000
Subject: [PATCH 9/9] pinctrl: Adjust nine checks for null pointers
Message-Id: <9294b4fd-f4f1-9540-973b-08c0cfee04c8@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <d8cce619-5a37-2f8b-1c07-a4c45443fb50@users.sourceforge.net>
In-Reply-To: <d8cce619-5a37-2f8b-1c07-a4c45443fb50@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 2 May 2017 11:04:55 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The script “checkpatch.pl” pointed information out like the following.

Comparison to NULL could be written …

Thus fix the affected source code places.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/pinctrl/core.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
index 7df16771fa13..b1044f07e0a1 100644
--- a/drivers/pinctrl/core.c
+++ b/drivers/pinctrl/core.c
@@ -170,7 +170,7 @@ const char *pin_get_name(struct pinctrl_dev *pctldev, const unsigned pin)
 	const struct pin_desc *desc;
 
 	desc = pin_desc_get(pctldev, pin);
-	if (desc = NULL) {
+	if (!desc) {
 		dev_err(pctldev->dev, "failed to get pin(%d) name\n",
 			pin);
 		return NULL;
@@ -214,7 +214,7 @@ static void pinctrl_free_pindescs(struct pinctrl_dev *pctldev,
 
 		pindesc = radix_tree_lookup(&pctldev->pin_desc_tree,
 					    pins[i].number);
-		if (pindesc != NULL) {
+		if (pindesc) {
 			radix_tree_delete(&pctldev->pin_desc_tree,
 					  pins[i].number);
 			if (pindesc->dynamic_name)
@@ -230,7 +230,7 @@ static int pinctrl_register_one_pin(struct pinctrl_dev *pctldev,
 	struct pin_desc *pindesc;
 
 	pindesc = pin_desc_get(pctldev, pin->number);
-	if (pindesc != NULL) {
+	if (pindesc) {
 		dev_err(pctldev->dev, "pin %d already registered\n",
 			pin->number);
 		return -EINVAL;
@@ -248,7 +248,7 @@ static int pinctrl_register_one_pin(struct pinctrl_dev *pctldev,
 		pindesc->name = pin->name;
 	} else {
 		pindesc->name = kasprintf(GFP_KERNEL, "PIN%u", pin->number);
-		if (pindesc->name = NULL) {
+		if (!pindesc->name) {
 			kfree(pindesc);
 			return -ENOMEM;
 		}
@@ -402,7 +402,7 @@ static int pinctrl_get_device_gpio_range(unsigned gpio,
 		struct pinctrl_gpio_range *range;
 
 		range = pinctrl_match_gpio_range(pctldev, gpio);
-		if (range != NULL) {
+		if (range) {
 			*outdev = pctldev;
 			*outrange = range;
 			mutex_unlock(&pinctrldev_list_mutex);
@@ -947,7 +947,7 @@ static int add_setting(struct pinctrl *p, struct pinctrl_dev *pctldev,
 	else
 		setting->pctldev  			get_pinctrl_dev_from_devname(map->ctrl_dev_name);
-	if (setting->pctldev = NULL) {
+	if (!setting->pctldev) {
 		kfree(setting);
 		/* Do not defer probing of hogs (circular loop) */
 		if (!strcmp(map->ctrl_dev_name, map->dev_name))
@@ -1094,7 +1094,7 @@ struct pinctrl *pinctrl_get(struct device *dev)
 	 * return another pointer to it.
 	 */
 	p = find_pinctrl(dev);
-	if (p != NULL) {
+	if (p) {
 		dev_dbg(dev, "obtain a copy of previously claimed pinctrl\n");
 		kref_get(&p->users);
 		return p;
@@ -1565,7 +1565,7 @@ static int pinctrl_pins_show(struct seq_file *s, void *what)
 		pin = pctldev->desc->pins[i].number;
 		desc = pin_desc_get(pctldev, pin);
 		/* Pin space may be sparse */
-		if (desc = NULL)
+		if (!desc)
 			continue;
 
 		seq_printf(s, "pin %d (%s) ", pin, desc->name);
@@ -2145,7 +2145,7 @@ void pinctrl_unregister(struct pinctrl_dev *pctldev)
 {
 	struct pinctrl_gpio_range *range, *n;
 
-	if (pctldev = NULL)
+	if (!pctldev)
 		return;
 
 	mutex_lock(&pctldev->mutex);
-- 
2.12.2

