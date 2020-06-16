From: Colin Ian King <colin.king@canonical.com>
Date: Tue, 16 Jun 2020 11:56:00 +0000
Subject: Re: [PATCH] drm/i915/display: fix missing null check on allocated dsb object
Message-Id: <45e8594c-14e5-ba67-9708-1b72fa2c51d3@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200616114221.73971-1-colin.king@canonical.com>
 <20200616115459.GN4151@kadam>
In-Reply-To: <20200616115459.GN4151@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: David Airlie <airlied@linux.ie>, Animesh Manna <animesh.manna@intel.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-gfx@lists.freedesktop.org, Maarten Lankhorst <maarten.lankhorst@intel.com>

On 16/06/2020 12:54, Dan Carpenter wrote:
> On Tue, Jun 16, 2020 at 12:42:21PM +0100, Colin King wrote:
>> From: Colin Ian King <colin.king@canonical.com>
>>
>> Currently there is no null check for a failed memory allocation
>> on the dsb object and without this a null pointer dereference
>> error can occur. Fix this by adding a null check.
>>
>> Note: added a drm_err message in keeping with the error message style
>> in the function.
> 
> Don't give in to peer pressure!  That's like being a lemming when Disney
> film makers come to push you off the cliff to create the 1958 nature
> film "White Wilderness".

:-)

> 
> regards,
> dan carpenter
> 
