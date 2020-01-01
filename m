From: Julia Lawall <Julia.Lawall@inria.fr>
Date: Wed, 01 Jan 2020 07:43:21 +0000
Subject: [PATCH 03/16] [media] anysee: constify copied structure
Message-Id: <1577864614-5543-4-git-send-email-Julia.Lawall@inria.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1577864614-5543-1-git-send-email-Julia.Lawall@inria.fr>
In-Reply-To: <1577864614-5543-1-git-send-email-Julia.Lawall@inria.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Antti Palosaari <crope@iki.fi>
Cc: kernel-janitors@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org

The anysee_tda18212_config and anysee_tda18212_config2 structures
are only copied into other structures, so make them const.

The opportunity for this change was found using Coccinelle.

Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

---
 drivers/media/usb/dvb-usb-v2/anysee.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/dvb-usb-v2/anysee.c b/drivers/media/usb/dvb-usb-v2/anysee.c
index fb6d99dea31a..94b8d3e5d8f7 100644
--- a/drivers/media/usb/dvb-usb-v2/anysee.c
+++ b/drivers/media/usb/dvb-usb-v2/anysee.c
@@ -318,14 +318,14 @@ static struct tda10023_config anysee_tda10023_tda18212_config = {
 	.deltaf = 0xba02,
 };
 
-static struct tda18212_config anysee_tda18212_config = {
+static const struct tda18212_config anysee_tda18212_config = {
 	.if_dvbt_6 = 4150,
 	.if_dvbt_7 = 4150,
 	.if_dvbt_8 = 4150,
 	.if_dvbc = 5000,
 };
 
-static struct tda18212_config anysee_tda18212_config2 = {
+static const struct tda18212_config anysee_tda18212_config2 = {
 	.if_dvbt_6 = 3550,
 	.if_dvbt_7 = 3700,
 	.if_dvbt_8 = 4150,
