From: Jason Wang <jasowang@redhat.com>
Date: Wed, 18 Nov 2020 06:08:17 +0000
Subject: Re: [PATCH net] vhost_vdpa: Return -EFUALT if copy_from_user() fails
Message-Id: <e7242333-b364-c2d8-53f5-1f688fc4d0b5@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201023120853.GI282278@mwanda>
 <20201023113326-mutt-send-email-mst@kernel.org>
 <4485cc8d-ac69-c725-8493-eda120e29c41@redhat.com>
In-Reply-To: <4485cc8d-ac69-c725-8493-eda120e29c41@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: "Michael S. Tsirkin" <mst@redhat.com>, Dan Carpenter <dan.carpenter@oracle.com>
Cc: kvm@vger.kernel.org, virtualization@lists.linux-foundation.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, kuba@kernel.org


On 2020/10/26 上午10:59, Jason Wang wrote:
>
> On 2020/10/23 下午11:34, Michael S. Tsirkin wrote:
>> On Fri, Oct 23, 2020 at 03:08:53PM +0300, Dan Carpenter wrote:
>>> The copy_to/from_user() functions return the number of bytes which we
>>> weren't able to copy but the ioctl should return -EFAULT if they fail.
>>>
>>> Fixes: a127c5bbb6a8 ("vhost-vdpa: fix backend feature ioctls")
>>> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>> Acked-by: Michael S. Tsirkin <mst@redhat.com>
>> Needed for stable I guess.
>
>
> Agree.
>
> Acked-by: Jason Wang <jasowang@redhat.com>


Hi Michael.

I don't see this in your tree, please consider to merge.

Thanks
