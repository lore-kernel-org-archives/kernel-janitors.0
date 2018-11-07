From: Jonathan Corbet <corbet@lwn.net>
Date: Wed, 07 Nov 2018 22:31:04 +0000
Subject: Re: [PATCH] Documentation: fix spelling mistake, EACCESS -> EACCES
Message-Id: <20181107153104.71eddf4d@lwn.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181026172549.3628-1-colin.king@canonical.com>
In-Reply-To: <20181026172549.3628-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Jeremy Kerr <jk@ozlabs.org>, David Airlie <airlied@linux.ie>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <sean@poorly.run>, linuxppc-dev@lists.ozlabs.org, linux-doc@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, 26 Oct 2018 18:25:49 +0100
Colin King <colin.king@canonical.com> wrote:

> Trivial fix to a spelling mistake of the error access name EACCESS,
> rename to EACCES
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  Documentation/filesystems/spufs.txt | 2 +-
>  Documentation/gpu/drm-uapi.rst      | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)

Applied, thanks.  

This is the first patch to spufs.txt since 2006...I wonder if that stuff
is being used by anybody...

jon
