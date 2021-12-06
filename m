Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 015D9C433F5
	for <kernel-janitors@archiver.kernel.org>; Mon,  6 Dec 2021 08:41:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239592AbhLFIoz convert rfc822-to-8bit (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 6 Dec 2021 03:44:55 -0500
Received: from out4436.biz.mail.alibaba.com ([47.88.44.36]:36924 "EHLO
        out4436.biz.mail.alibaba.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S239590AbhLFIoz (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 6 Dec 2021 03:44:55 -0500
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R151e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e01424;MF=guanjun@linux.alibaba.com;NM=1;PH=DS;RN=5;SR=0;TI=SMTPD_---0UzaDhSl_1638780084;
Received: from smtpclient.apple(mailfrom:guanjun@linux.alibaba.com fp:SMTPD_---0UzaDhSl_1638780084)
          by smtp.aliyun-inc.com(127.0.0.1);
          Mon, 06 Dec 2021 16:41:25 +0800
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.100.0.2.22\))
Subject: Re: [PATCH 1/1] vduse: moving kvfree into caller
From:   guanjun <guanjun@linux.alibaba.com>
In-Reply-To: <CACGkMEtNj_CyqV01MCKn6xa01d4FHscCZ9dgt3JCqrQYWaHpMA@mail.gmail.com>
Date:   Mon, 6 Dec 2021 16:41:24 +0800
Cc:     mst <mst@redhat.com>, Yongji Xie <xieyongji@bytedance.com>,
        virtualization <virtualization@lists.linux-foundation.org>,
        kernel-janitors@vger.kernel.org
Content-Transfer-Encoding: 8BIT
Message-Id: <DBA60F08-4A04-4303-92D0-A7DCCA810883@linux.alibaba.com>
References: <1638776941-34156-1-git-send-email-guanjun@linux.alibaba.com>
 <CACGkMEtNj_CyqV01MCKn6xa01d4FHscCZ9dgt3JCqrQYWaHpMA@mail.gmail.com>
To:     Jason Wang <jasowang@redhat.com>
X-Mailer: Apple Mail (2.3654.100.0.2.22)
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org



> 2021年12月6日 下午4:00，Jason Wang <jasowang@redhat.com> 写道：
> 
> On Mon, Dec 6, 2021 at 3:54 PM Guanjun <guanjun@linux.alibaba.com> wrote:
>> 
>> From: Guanjun <guanjun@linux.alibaba.com>
>> 
>> This free action should be moved into caller 'vduse_ioctl' in
>> concert with the allocation.
>> 
>> No functional change.
>> 
>> Fixes: c8a6153b6c59 ("vduse: Introduce VDUSE - vDPA Device in Userspace")
> 
> Does this fix a real problem? If not, let's try not using fixes tags here.
> 
> Thanks

This is not a bugfix, just a cleanup.
Will fix this.

Thanks for your reply.
Guanjun

> 
>> Signed-off-by: Guanjun <guanjun@linux.alibaba.com>
>> ---
>> drivers/vdpa/vdpa_user/vduse_dev.c | 3 ++-
>> 1 file changed, 2 insertions(+), 1 deletion(-)
>> 
>> diff --git a/drivers/vdpa/vdpa_user/vduse_dev.c b/drivers/vdpa/vdpa_user/vduse_dev.c
>> index c9204c62f339..477a5a592002 100644
>> --- a/drivers/vdpa/vdpa_user/vduse_dev.c
>> +++ b/drivers/vdpa/vdpa_user/vduse_dev.c
>> @@ -1355,7 +1355,6 @@ static int vduse_create_dev(struct vduse_dev_config *config,
>> err_str:
>>        vduse_dev_destroy(dev);
>> err:
>> -       kvfree(config_buf);
>>        return ret;
>> }
>> 
>> @@ -1406,6 +1405,8 @@ static long vduse_ioctl(struct file *file, unsigned int cmd,
>>                }
>>                config.name[VDUSE_NAME_MAX - 1] = '\0';
>>                ret = vduse_create_dev(&config, buf, control->api_version);
>> +               if (ret)
>> +                       kvfree(buf);
>>                break;
>>        }
>>        case VDUSE_DESTROY_DEV: {
>> --
>> 2.27.0
>> 

