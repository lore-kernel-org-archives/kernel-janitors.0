From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 17 May 2017 19:30:12 +0000
Subject: Re: [PATCH] drm/amd/powerplay: ensure loop does not wraparound on decrement
Message-Id: <20170517193011.ragtuhqqpddn3jsx@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170517181346.11715-1-colin.king@canonical.com>
In-Reply-To: <20170517181346.11715-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, Eric Huang <JinHuiEric.Huang@amd.com>, Huang Rui <ray.huang@amd.com>, dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>, Rex Zhu <Rex.Zhu@amd.com>, Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>

I sent a patch for this bug earlier.  There is a second bug later in the
function which my patch fixes as well.

regards,
dan carpenter

