From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 31 Jul 2014 09:44:22 +0000
Subject: re: extcon: sm5502: Add support new SM5502 extcon device driver
Message-Id: <20140731094422.GA30971@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Chanwoo Choi,

The patch 914b881f9452: "extcon: sm5502: Add support new SM5502
extcon device driver" from May 22, 2014, leads to the following
static checker warning:

	drivers/extcon/extcon-sm5502.c:398 sm5502_muic_cable_handler()
	warn: we tested 'attached' before and it was 'false'

drivers/extcon/extcon-sm5502.c
   381  static int sm5502_muic_cable_handler(struct sm5502_muic_info *info,
   382                                       bool attached)
   383  {
   384          static unsigned int prev_cable_type = SM5502_MUIC_ADC_GROUND;
   385          const char **cable_names = info->edev->supported_cable;
   386          unsigned int cable_type = SM5502_MUIC_ADC_GROUND;
   387          unsigned int con_sw = DM_DP_SWITCH_OPEN;
   388          unsigned int vbus_sw = VBUSIN_SWITCH_OPEN;
   389          unsigned int idx = 0;
   390          int ret;
   391  
   392          if (!cable_names)
   393                  return 0;
   394  
   395          /* Get the type of attached or detached cable */
   396          if (attached)
                    ^^^^^^^^
   397                  cable_type = sm5502_muic_get_cable_type(info);
   398          else if (!attached)
                         ^^^^^^^^^
This is obviously implied.  It upsets the static checkers to check known
variables.

   399                  cable_type = prev_cable_type;
   400          prev_cable_type = cable_type;

regards,
dan carpenter
