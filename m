From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 16 Jun 2016 08:09:49 +0000
Subject: Re: [patch] drm/amdgpu: missing bounds check in amdgpu_set_pp_force_state()
Message-Id: <20160616080949.GI32247@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160616064119.GA23129@mwanda> <5762548B.6060906@bfs.de>
 <20160616075410.GH32247@mwanda> <57625C18.2020208@amd.com>
In-Reply-To: <57625C18.2020208@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: Jammy Zhou <Jammy.Zhou@amd.com>, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org, Eric Huang <JinHuiEric.Huang@amd.com>, Alex Deucher <alexander.deucher@amd.com>, Rex Zhu <Rex.Zhu@amd.com>, walter harms <wharms@bfs.de>

Sure, I'll resend.  Unsigned is a little cleaner.  There is no new error
code/message or change in behavior though either way.

regards,
dan carpenter

