From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Mon, 17 Mar 2014 10:24:19 +0000
Subject: Re: [patch] drm: use after free in drm_pci_exit()
Message-Id: <CAKMK7uEjiXP8oeaBS9dRC37gJaRcdvOD5GF4rHE+6mzW7D5gUw@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20140120103116.GD14233@elgon.mountain> <53232C12.20108@nvidia.com>
In-Reply-To: <53232C12.20108@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Aaron Plattner <aplattner@nvidia.com>
Cc: kernel-janitors@vger.kernel.org, dri-devel <dri-devel@lists.freedesktop.org>, Dan Carpenter <dan.carpenter@oracle.com>

On Fri, Mar 14, 2014 at 5:19 PM, Aaron Plattner <aplattner@nvidia.com> wrote:
> On 01/20/2014 02:31 AM, Dan Carpenter wrote:
>>
>> We can't use "dev" after we freed it on the line before.
>>
>> Fixes: b3f2333de8e8 ('drm: restrict the device list for shadow attached
>> drivers')
>> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>
>
> I just ran into this same problem, and this change fixes it.
>
> Tested-by: Aaron Plattner <aplattner@nvidia.com>
> Reviewed-by: Aaron Plattner <aplattner@nvidia.com>
>
> and since he just sent me an independently-developed identical change,
>
> Reviewed-by: John Hubbard <jhubbard@nvidia.com>

Hey, I have such a patch too!

http://patchwork.freedesktop.org/patch/19163/

Dave? I think I'll just send a pull for my random pile of drm core
patches I've shepharded ...

Cheers, Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
