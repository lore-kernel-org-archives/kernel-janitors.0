From: kbuild test robot <lkp@intel.com>
Date: Tue, 05 Jan 2016 11:53:47 +0000
Subject: Re: [patch v2] usb: gadget: f_midi: missing unlock on error path
Message-Id: <201601051926.BEbGcnh7%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160105102809.GA26420@mwanda>
In-Reply-To: <20160105102809.GA26420@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Dan,

[auto build test WARNING on balbi-usb/next]
[also build test WARNING on v4.4-rc8 next-20160105]
[if your patch is applied to the wrong git tree, please drop us a note to help improving the system]

url:    https://github.com/0day-ci/linux/commits/Dan-Carpenter/usb-gadget-f_midi-missing-unlock-on-error-path/20160105-183115
base:   https://git.kernel.org/pub/scm/linux/kernel/git/balbi/usb.git next


coccinelle warnings: (new ones prefixed by >>)

>> drivers/usb/gadget/function/f_midi.c:1233:14-21: ERROR: midi is NULL but dereferenced.

vim +1233 drivers/usb/gadget/function/f_midi.c

e1e3d7ec Felipe F. Tonello     2015-12-01  1217  
6f1de344 Andrzej Pietrasiewicz 2014-10-16  1218  	++opts->refcnt;
6f1de344 Andrzej Pietrasiewicz 2014-10-16  1219  	mutex_unlock(&opts->lock);
b85e9de9 Andrzej Pietrasiewicz 2014-10-16  1220  
b85e9de9 Andrzej Pietrasiewicz 2014-10-16  1221  	midi->func.name		= "gmidi function";
b85e9de9 Andrzej Pietrasiewicz 2014-10-16  1222  	midi->func.bind		= f_midi_bind;
b85e9de9 Andrzej Pietrasiewicz 2014-10-16  1223  	midi->func.unbind	= f_midi_unbind;
b85e9de9 Andrzej Pietrasiewicz 2014-10-16  1224  	midi->func.set_alt	= f_midi_set_alt;
b85e9de9 Andrzej Pietrasiewicz 2014-10-16  1225  	midi->func.disable	= f_midi_disable;
b85e9de9 Andrzej Pietrasiewicz 2014-10-16  1226  	midi->func.free_func	= f_midi_free;
b85e9de9 Andrzej Pietrasiewicz 2014-10-16  1227  
b85e9de9 Andrzej Pietrasiewicz 2014-10-16  1228  	return &midi->func;
b85e9de9 Andrzej Pietrasiewicz 2014-10-16  1229  
b85e9de9 Andrzej Pietrasiewicz 2014-10-16  1230  setup_fail:
39920a18 Dan Carpenter         2016-01-05  1231  	mutex_unlock(&opts->lock);
b85e9de9 Andrzej Pietrasiewicz 2014-10-16  1232  	for (--i; i >= 0; i--)
b85e9de9 Andrzej Pietrasiewicz 2014-10-16 @1233  		kfree(midi->in_port[i]);
b85e9de9 Andrzej Pietrasiewicz 2014-10-16  1234  	kfree(midi);
b85e9de9 Andrzej Pietrasiewicz 2014-10-16  1235  	return ERR_PTR(status);
b85e9de9 Andrzej Pietrasiewicz 2014-10-16  1236  }
b85e9de9 Andrzej Pietrasiewicz 2014-10-16  1237  
b85e9de9 Andrzej Pietrasiewicz 2014-10-16  1238  DECLARE_USB_FUNCTION_INIT(midi, f_midi_alloc_inst, f_midi_alloc);

:::::: The code at line 1233 was first introduced by commit
:::::: b85e9de9e818de0dcbc50b7b4242192eb6194855 usb: gadget: f_midi: convert to new function interface with backward compatibility

:::::: TO: Andrzej Pietrasiewicz <andrzej.p@samsung.com>
:::::: CC: Felipe Balbi <balbi@ti.com>

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
