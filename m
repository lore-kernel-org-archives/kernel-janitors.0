From: Fengguang Wu <fengguang.wu@intel.com>
Date: Sun, 07 Oct 2012 09:38:12 +0000
Subject: drivers/media/dvb/frontends/dib8000.c:1837 dib8000_tune() warn: variable dereferenced before check '
Message-Id: <20121007093812.GA9317@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Patrick Boettcher <pboettcher@dibcom.fr>
Cc: Mauro Carvalho Chehab <mchehab@redhat.com>, kernel-janitors@vger.kernel.org, linux-media <linux-media@vger.kernel.org>

Hi Patrick,

FYI, the below commit triggered a smatch warning:

77e2c0f V4L/DVB (12900): DiB8000: added support for DiBcom ISDB-T/ISDB-Tsb demodulator DiB8000

+ drivers/media/dvb/frontends/dib8000.c:1837 dib8000_tune() warn: variable dereferenced before check 'state' (see line 1834)

vim +1837 drivers/media/dvb/frontends/dib8000.c

77e2c0f5 Patrick Boettcher 2009-08-17  1830  static int dib8000_tune(struct dvb_frontend *fe)
77e2c0f5 Patrick Boettcher 2009-08-17  1831  {
77e2c0f5 Patrick Boettcher 2009-08-17  1832  	struct dib8000_state *state = fe->demodulator_priv;
77e2c0f5 Patrick Boettcher 2009-08-17  1833  	int ret = 0;
77e2c0f5 Patrick Boettcher 2009-08-17  1834  	u16 value, mode = fft_to_mode(state);
77e2c0f5 Patrick Boettcher 2009-08-17  1835  
77e2c0f5 Patrick Boettcher 2009-08-17  1836  	// we are already tuned - just resuming from suspend
77e2c0f5 Patrick Boettcher 2009-08-17 @1837  	if (state = NULL)
77e2c0f5 Patrick Boettcher 2009-08-17  1838  		return -EINVAL;
77e2c0f5 Patrick Boettcher 2009-08-17  1839  

---
0-DAY kernel build testing backend         Open Source Technology Center
Fengguang Wu, Yuanhan Liu                              Intel Corporation
