From: Jack Morgenstein <jackm@dev.mellanox.co.il>
Date: Thu, 26 Dec 2013 11:18:34 +0000
Subject: Re: mlx4: Structures and init/teardown for VF resource quotas
Message-Id: <20131226131834.62b4ad2a@jpm-OptiPlex-GX620>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20131218131833.GA16427@elgon.mountain>
In-Reply-To: <20131218131833.GA16427@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wed, 18 Dec 2013 16:18:34 +0300
Dan Carpenter <dan.carpenter@oracle.com> wrote:

>    260  
>    261                  size > priv->mfunc.master.res_tracker.res_alloc[RES_QP].quota[slave]; ^^^^^
> My concern here is that there are MLX4_MAX_NUM_VF (64) elements in the
> .quota[] array and MLX4_MAX_NUM_SLAVES (80) slaves.

Hi Dan,

There is no problem here.  The ConnectX driver for SRIOV supports only
1 PF.  The code snippet below indicates the initialization of the
structure in the static-checker warning.

The array is malloc'ed as below, with num_vfs+1 elements.  num_vfs is
the value given in the mlx4_core num_vfs module parameter.  Since slave
numbers are given sequentially for the requested VFs, we will never
overflow the array (e.g., if num_vfs = 5, say, then "slave" 0 is the
PF, and slaves 1..5 are the VF slave numbers. Thus, an array of size 6
is sufficient and will never overflow).

Regards,
-Jack

======================
int mlx4_init_resource_tracker(struct mlx4_dev *dev)
{
        struct mlx4_priv *priv = mlx4_priv(dev);
        int i, j;
        int t;

        priv->mfunc.master.res_tracker.slave_list ....
        for (i = 0; i < MLX4_NUM_OF_RESOURCE_TYPE; i++) {
                struct resource_allocator *res_alloc                         &priv->mfunc.master.res_tracker.res_alloc[i];
=>             res_alloc->quota = kmalloc((dev->num_vfs + 1) *
                sizeof(int), GFP_KERNEL);


