From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 16 Feb 2021 10:14:53 +0000
Subject: Re: [bug report] octeontx2-af: cn10k: MAC internal loopback support
Message-Id: <20210216101453.GF2222@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <YCuaqPZw9V8HeCrU@mwanda>
In-Reply-To: <YCuaqPZw9V8HeCrU@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, Feb 16, 2021 at 01:12:56PM +0300, Dan Carpenter wrote:
> Hello Hariprasad Kelam,
> 
> The patch 3ad3f8f93c81: "octeontx2-af: cn10k: MAC internal loopback
> support" from Feb 11, 2021, leads to the following static checker
> warning:
> 
> 	drivers/net/ethernet/marvell/octeontx2/af/rvu_cgx.c:731 rvu_cgx_config_intlbk()
> 	error: uninitialized symbol 'cgx_id'.
> 
> drivers/net/ethernet/marvell/octeontx2/af/rvu_cgx.c
>    723  static int rvu_cgx_config_intlbk(struct rvu *rvu, u16 pcifunc, bool en)
>    724  {
>    725          struct mac_ops *mac_ops;
>    726          u8 cgx_id, lmac_id;
>                    ^^^^^^
> 
>    727  
>    728          if (!is_cgx_config_permitted(rvu, pcifunc))
>    729                  return -EPERM;
>    730  
>    731          mac_ops = get_mac_ops(rvu_cgx_pdata(cgx_id, rvu));
>                                                     ^^^^^^
> Uninitialized.  This code probably hasn't been tested very well.
> 
>    732  
>    733          return mac_ops->mac_lmac_intl_lbk(rvu_cgx_pdata(cgx_id, rvu),
>    734                                            lmac_id, en);
                                                    ^^^^^^^

drivers/net/ethernet/marvell/octeontx2/af/rvu_cgx.c:734
rvu_cgx_config_intlbk() error: uninitialized symbol 'lmac_id'.

This isn't initialized either.

regards,
dan carpenter
