From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 11 Jun 2015 14:51:22 +0000
Subject: Re: [patch] drm/amdgpu: potential NULL dereference on error
Message-Id: <20150611145121.GB30834@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150611084933.GA27393@mwanda> <55797906.2090501@bfs.de>
 <20150611122028.GK11734@mwanda> <55799CAE.4070809@bfs.de>
In-Reply-To: <55799CAE.4070809@bfs.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: walter harms <wharms@bfs.de>
Cc: Marek =?utf-8?B?T2zFocOhaw==?= <marek.olsak@amd.com>, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org, yanyang1 <young.yang@amd.com>, Alex Deucher <alexander.deucher@amd.com>, Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>

On Thu, Jun 11, 2015 at 04:35:26PM +0200, walter harms wrote:
> You still have to check 2 types of error return here.
> I simply do not understand why ebugfs_create_file() does not return -ENOMEM
> (or returns NULL on any error).

To be honest, I don't know why debugfs_create_file() doesn't just return
NULL when it is configured out.  I think I have asked this before...

I think the answer is that it seemed like a good idea at the time.
These days we would probably prefer to use:

	if (enabled(CONFIG_DEBUGFS)) {

to test if it's there or not.  Maybe that's still the right thing to
check here.

But debugfs error handling is designed so that under normal situations
you don't have to check for errors.  It turns out that everyone still
does because they are used to checking for errors.

The only reason we have to check here is because we do:

	i_size_write(ent->d_inode, adev->rmmio_size);
                     ^^^^^^^^^^^^

Dereference.

regards,
dan carpenter

