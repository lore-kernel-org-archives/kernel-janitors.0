From: Jiri Pirko <jiri@mellanox.com>
Date: Tue, 07 Feb 2017 11:27:27 +0000
Subject: Re: [bug report] mlxsw: spectrum: Introduce ACL core with simple TCAM implementation
Message-Id: <20170207112727.GG2067@nanopsycho>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170207110126.GA18959@mwanda>
In-Reply-To: <20170207110126.GA18959@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Tue, Feb 07, 2017 at 12:01:26PM CET, dan.carpenter@oracle.com wrote:
>Hello Jiri Pirko,
>
>The patch 22a677661f56: "mlxsw: spectrum: Introduce ACL core with
>simple TCAM implementation" from Feb 3, 2017, leads to the following
>static checker warning:
>
>	drivers/net/ethernet/mellanox/mlxsw/spectrum_acl_tcam.c:819 mlxsw_sp_acl_tcam_chunk_create()
>	warn: impossible condition '(priority = (-1)) => (0-u32max = u64max)'

Thanks, I already have fix for this queued-up.



>
>drivers/net/ethernet/mellanox/mlxsw/spectrum_acl_tcam.c
>   810  static struct mlxsw_sp_acl_tcam_chunk *
>   811  mlxsw_sp_acl_tcam_chunk_create(struct mlxsw_sp *mlxsw_sp,
>   812                                 struct mlxsw_sp_acl_tcam_group *group,
>   813                                 unsigned int priority,
>                                       ^^^^^^^^^^^^^^^^^^^^^
>
>This should probably be changed to unsigned long?
>
>   814                                 struct mlxsw_afk_element_usage *elusage)
>   815  {
>   816          struct mlxsw_sp_acl_tcam_chunk *chunk;
>   817          int err;
>   818  
>   819          if (priority = MLXSW_SP_ACL_TCAM_CATCHALL_PRIO)
>                    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>UINT_MAX != ULONG_MAX on 64 bit systems.
>
>   820                  return ERR_PTR(-EINVAL);
>   821  
>   822          chunk = kzalloc(sizeof(*chunk), GFP_KERNEL);
>   823          if (!chunk)
>   824                  return ERR_PTR(-ENOMEM);
>   825          chunk->priority = priority;
>   826          chunk->group = group;
>   827          chunk->ref_count = 1;
>   828  
>
>regards,
>dan carpenter
