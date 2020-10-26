From: Jason Wang <jasowang@redhat.com>
Date: Mon, 26 Oct 2020 02:59:37 +0000
Subject: Re: [PATCH net] vhost_vdpa: Return -EFUALT if copy_from_user() fails
Message-Id: <4485cc8d-ac69-c725-8493-eda120e29c41@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201023120853.GI282278@mwanda>
 <20201023113326-mutt-send-email-mst@kernel.org>
In-Reply-To: <20201023113326-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: "Michael S. Tsirkin" <mst@redhat.com>, Dan Carpenter <dan.carpenter@oracle.com>
Cc: kvm@vger.kernel.org, virtualization@lists.linux-foundation.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, kuba@kernel.org


On 2020/10/23 下午11:34, Michael S. Tsirkin wrote:
> On Fri, Oct 23, 2020 at 03:08:53PM +0300, Dan Carpenter wrote:
>> The copy_to/from_user() functions return the number of bytes which we
>> weren't able to copy but the ioctl should return -EFAULT if they fail.
>>
>> Fixes: a127c5bbb6a8 ("vhost-vdpa: fix backend feature ioctls")
>> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> Acked-by: Michael S. Tsirkin <mst@redhat.com>
> Needed for stable I guess.


Agree.

Acked-by: Jason Wang <jasowang@redhat.com>


>> ---
>>   drivers/vhost/vdpa.c | 10 +++++-----
>>   1 file changed, 5 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/vhost/vdpa.c b/drivers/vhost/vdpa.c
>> index 62a9bb0efc55..c94a97b6bd6d 100644
>> --- a/drivers/vhost/vdpa.c
>> +++ b/drivers/vhost/vdpa.c
>> @@ -428,12 +428,11 @@ static long vhost_vdpa_unlocked_ioctl(struct file *filep,
>>   	void __user *argp = (void __user *)arg;
>>   	u64 __user *featurep = argp;
>>   	u64 features;
>> -	long r;
>> +	long r = 0;
>>   
>>   	if (cmd = VHOST_SET_BACKEND_FEATURES) {
>> -		r = copy_from_user(&features, featurep, sizeof(features));
>> -		if (r)
>> -			return r;
>> +		if (copy_from_user(&features, featurep, sizeof(features)))
>> +			return -EFAULT;
>>   		if (features & ~VHOST_VDPA_BACKEND_FEATURES)
>>   			return -EOPNOTSUPP;
>>   		vhost_set_backend_features(&v->vdev, features);
>> @@ -476,7 +475,8 @@ static long vhost_vdpa_unlocked_ioctl(struct file *filep,
>>   		break;
>>   	case VHOST_GET_BACKEND_FEATURES:
>>   		features = VHOST_VDPA_BACKEND_FEATURES;
>> -		r = copy_to_user(featurep, &features, sizeof(features));
>> +		if (copy_to_user(featurep, &features, sizeof(features)))
>> +			r = -EFAULT;
>>   		break;
>>   	default:
>>   		r = vhost_dev_ioctl(&v->vdev, cmd, argp);
