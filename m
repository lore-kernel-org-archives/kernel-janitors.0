From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sun, 10 May 2020 09:53:03 +0000
Subject: [PATCH] extcon: adc-jack: Fix an error handling path in 'adc_jack_probe()'
Message-Id: <20200510095303.231635-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: myungjoo.ham@samsung.com, cw00.choi@samsung.com, anish198519851985@gmail.com, gregkh@linuxfoundation.org, jic23@kernel.org, lars@metafoo.de
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

In some error handling paths, a call to 'iio_channel_get()' is not balanced
by a corresponding call to 'iio_channel_release()'.

This can be achieved easily by using the devm_ variant of
'iio_channel_get()'.

This has the extra benefit to simplify the remove function.

Fixes: 19939860dcae ("extcon: adc_jack: adc-jack driver to support 3.5 pi or simliar devices")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
This patch in a more complete version than commit 5a696d9760fe
("extcon: adc-jack: Release IIO channel on driver remove") which fixed the
issue for the remove function only.
---
 drivers/extcon/extcon-adc-jack.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/extcon/extcon-adc-jack.c b/drivers/extcon/extcon-adc-jack.c
index ad02dc6747a4..0317b614b680 100644
--- a/drivers/extcon/extcon-adc-jack.c
+++ b/drivers/extcon/extcon-adc-jack.c
@@ -124,7 +124,7 @@ static int adc_jack_probe(struct platform_device *pdev)
 	for (i = 0; data->adc_conditions[i].id != EXTCON_NONE; i++);
 	data->num_conditions = i;
 
-	data->chan = iio_channel_get(&pdev->dev, pdata->consumer_channel);
+	data->chan = devm_iio_channel_get(&pdev->dev, pdata->consumer_channel);
 	if (IS_ERR(data->chan))
 		return PTR_ERR(data->chan);
 
@@ -164,7 +164,6 @@ static int adc_jack_remove(struct platform_device *pdev)
 
 	free_irq(data->irq, data);
 	cancel_work_sync(&data->handler.work);
-	iio_channel_release(data->chan);
 
 	return 0;
 }
-- 
2.25.1
