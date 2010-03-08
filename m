From: Dan Carpenter <error27@gmail.com>
Date: Mon, 08 Mar 2010 12:16:36 +0000
Subject: telephony: precendence issue
Message-Id: <20100308121636.GH6469@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

drivers/telephony/ixj.c +6834 ixj_selfprobe(67)
  6833                  case QTI_PHONEJACK:
  6834                          if (!j->dsp.low != 0x20) {
  6835                                  j->dsp.high = 0x80;
  6836                                  j->dsp.low = 0x20;

"!" has precedence over "!=" and since both 1 and 0 are not equal
to 0x20 the condition is always true.

I'm pretty sure the "!" is a stray and the test should be:
	if (j->dsp.low != 0x20) {
but I don't have the hardware to test this.

regards,
dan carpenter
