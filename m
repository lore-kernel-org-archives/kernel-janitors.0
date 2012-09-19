From: Fengguang Wu <fengguang.wu@intel.com>
Date: Wed, 19 Sep 2012 00:46:05 +0000
Subject: [nouveau:master 1/80] nouveau_connector.c:535 nouveau_connector_set_property() warn: variable derefe
Message-Id: <20120919004605.GA10838@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Ben,

FYI, a pretty old smatch warning:

drivers/gpu/drm/nouveau/nouveau_connector.c:535 nouveau_connector_set_property() warn: variable dereferenced before check 'nv_encoder' (see line 413)

vim +535 drivers/gpu/drm/nouveau/nouveau_connector.c
   412         struct nouveau_encoder *nv_encoder = nv_connector->detected_encoder;
   413         struct drm_encoder *encoder = to_drm_encoder(nv_encoder);
...
   534	
 > 535		if (nv_encoder && nv_encoder->dcb->type = OUTPUT_TV)
   536			return get_slave_funcs(encoder)->set_property(
   537				encoder, connector, property, value);
   538	
   539		return -EINVAL;
   540	}

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu <wfg@linux.intel.com>                     Intel Corporation
