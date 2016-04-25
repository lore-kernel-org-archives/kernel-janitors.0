From: Eric Engestrom <eric.engestrom@imgtec.com>
Date: Mon, 25 Apr 2016 09:11:29 +0000
Subject: Re: [patch] drm: atmel-hlcdc: fix a NULL check
Message-Id: <20160425091129.GN32731@imgtec.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160425090454.GA25366@mwanda>
In-Reply-To: <20160425090454.GA25366@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org

On Mon, Apr 25, 2016 at 12:04:54PM +0300, Dan Carpenter wrote:
> If kmalloc() returned NULL we would end up dereferencing "state" a
> couple lines later.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Reviewed-by: Eric Engestrom <eric.engestrom@imgtec.com>
