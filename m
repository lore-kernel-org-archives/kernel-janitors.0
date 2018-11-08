From: Jeremy Kerr <jk@ozlabs.org>
Date: Thu, 08 Nov 2018 00:38:15 +0000
Subject: Re: [PATCH] Documentation: fix spelling mistake, EACCESS -> EACCES
Message-Id: <d1048515-239a-2686-e897-fb2a2b8d180f@ozlabs.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181026172549.3628-1-colin.king@canonical.com>
 <20181107153104.71eddf4d@lwn.net>
In-Reply-To: <20181107153104.71eddf4d@lwn.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jonathan Corbet <corbet@lwn.net>, Colin King <colin.king@canonical.com>
Cc: David Airlie <airlied@linux.ie>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <sean@poorly.run>, linuxppc-dev@lists.ozlabs.org, linux-doc@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Michael Ellerman <michael@ellerman.id.au>linuxppc-dev@lists.ozlabs.org

Hi Jon,

>> Signed-off-by: Colin Ian King <colin.king@canonical.com>
>> ---
>>   Documentation/filesystems/spufs.txt | 2 +-
>>   Documentation/gpu/drm-uapi.rst      | 4 ++--
>>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> Applied, thanks.
> 
> This is the first patch to spufs.txt since 2006...I wonder if that stuff
> is being used by anybody...

Anyone who is using the vector processors on the Cell BE processors will
be using it. However, that hardware is becoming pretty rare now.

We'll want to remove the spufs bits if/when we drop support for the cell
platforms (IBM QSxx, PS3, celleb). mpe: any ides on that? Do you have a 
policy for dropping platform support?

Cheers,


Jeremy
