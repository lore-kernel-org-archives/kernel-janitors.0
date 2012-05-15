From: Michel =?ISO-8859-1?Q?D=E4nzer?= <michel@daenzer.net>
Date: Tue, 15 May 2012 14:34:57 +0000
Subject: Re: [patch] drm/radeon: check kmalloc() for failures
Message-Id: <1337092497.7335.289.camel@thor.local>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120515085659.GE30265@elgon.mountain>
In-Reply-To: <20120515085659.GE30265@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org

On Die, 2012-05-15 at 11:56 +0300, Dan Carpenter wrote: 
> We can just return -ENOMEM here if the allocation fails.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Reviewed-by: Michel Dänzer <michel.daenzer@amd.com>


-- 
Earthling Michel Dänzer           |                   http://www.amd.com
Libre software enthusiast         |          Debian, X and DRI developer
