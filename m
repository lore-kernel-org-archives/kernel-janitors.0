From: "Michael S. Tsirkin" <mst@redhat.com>
Date: Mon, 10 Aug 2020 14:35:39 +0000
Subject: Re: [PATCH] vdpa/mlx5: Fix pointer math in mlx5_vdpa_get_config()
Message-Id: <20200810103522-mutt-send-email-mst@kernel.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200808093241.GB115053@mwanda>
 <BN8PR12MB3425E1FCC3E20A04182640D2AB470@BN8PR12MB3425.namprd12.prod.outlook.com>
 <20200810103147.GJ1793@kadam>
In-Reply-To: <20200810103147.GJ1793@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Eli Cohen <elic@nvidia.com>, Eli Cohen <eli@mellanox.com>, Jason Wang <jasowang@redhat.com>, Parav Pandit <parav@mellanox.com>, "virtualization@lists.linux-foundation.org" <virtualization@lists.linux-foundation.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

On Mon, Aug 10, 2020 at 01:31:47PM +0300, Dan Carpenter wrote:
> On Sun, Aug 09, 2020 at 06:34:04AM +0000, Eli Cohen wrote:
> > Acked-by: Eli Cohen <elic@nvidia.com>
> > 
> > BTW, vdpa_sim has the same bug.
> > 
> 
> I sent a patch for that on April 6.
> 
> [PATCH 2/2] vdpa: Fix pointer math bug in vdpasim_get_config()
> 
> Jason acked the patch but it wasn't applied.
> 
> regards,
> dan carpenter

Oh sorry. I'll drop my patch and queue yours then.
