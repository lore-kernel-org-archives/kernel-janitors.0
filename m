From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Tue, 12 Jul 2016 20:57:20 +0000
Subject: Question about a return value in drivers/net/ethernet/mellanox/mlxsw/spectrum_router.c
Message-Id: <462b3372-aa68-6787-f6fe-3c884b8b8278@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi,

in file 'drivers/net/ethernet/mellanox/mlxsw/spectrum_router.c', in 
function 'mlxsw_sp_router_fib4_del', the code:

     ...
     vr = mlxsw_sp_vr_find(mlxsw_sp, fib4->tb_id, MLXSW_SP_L3_PROTO_IPV4);
     if (!vr) {
         dev_warn(mlxsw_sp->bus_info->dev, "Failed to find virtual 
router for FIB4 entry being removed.\n");
         return -ENOENT;
     }
     fib_entry = mlxsw_sp_fib_entry_lookup(vr->fib, &fib4->dst,
                           sizeof(fib4->dst), fib4->dst_len);
     if (!fib_entry) {
         dev_warn(mlxsw_sp->bus_info->dev, "Failed to find FIB4 entry 
being removed.\n");
         return PTR_ERR(vr);     <---------------------------------------
     }
     ...

looks spurious.

is the 'return PTR_ERR(vr)' correct?
vr should be a valid pointer at this point. It is used a few lines above 
in 'vr->fib'.

Best regards,

CJ



