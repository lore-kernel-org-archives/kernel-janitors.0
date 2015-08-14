From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 14 Aug 2015 09:08:10 +0000
Subject: re: hv_netvsc: Implement set_channels ethtool op
Message-Id: <20150814090810.GA6580@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Andrew Schwartzmeyer,

This is a semi-automatic email about new static checker warnings.

The patch b5960e6e2b5c: "hv_netvsc: Implement set_channels ethtool 
op" from Aug 11, 2015, leads to the following Smatch complaint:

drivers/net/hyperv/netvsc_drv.c:785 netvsc_set_channels()
	 warn: variable dereferenced before check 'nvdev' (see line 780)

drivers/net/hyperv/netvsc_drv.c
   779		struct netvsc_device_info device_info;
   780		const u32 num_chn = nvdev->num_chn;
                                    ^^^^^^^^^^^^^^
Deref.

   781		const u32 max_chn = min_t(u32, nvdev->max_chn, num_online_cpus());
                                               ^^^^^^^^^^^^^^
Deref.

   782		int ret = 0;
   783		bool recovering = false;
   784	
   785		if (!nvdev || nvdev->destroy)
                     ^^^^^
Check too late.

   786			return -ENODEV;
   787	

regards,
dan carpenter
