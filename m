Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB555C433E0
	for <kernel-janitors@archiver.kernel.org>; Wed, 17 Mar 2021 08:32:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7E37964FA7
	for <kernel-janitors@archiver.kernel.org>; Wed, 17 Mar 2021 08:32:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229688AbhCQIbu (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 17 Mar 2021 04:31:50 -0400
Received: from aserp2130.oracle.com ([141.146.126.79]:37436 "EHLO
        aserp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229673AbhCQIbj (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 17 Mar 2021 04:31:39 -0400
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
        by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12H8UZxv128112;
        Wed, 17 Mar 2021 08:31:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=GzgspRdwBgkoOp643xFkyrPHucv2bbNqWJaL7RaM9io=;
 b=PrIGeD38KvPr64cxVCZZPJ8GoQsX/cS1wQxlyI980+KAGR8E49lfHf4NgvXlzflU8V3/
 WLKiuMPWrGdGyn1bbErfepF1MD6lCFFhsj2pBZtwPvLz5gZgioivdiXgSuMLBe50hiov
 NxKyHQXCMmq/papd+5kIdo9FzcorOmDec8gbcYm5totH5gQr163xjFjmA8de5FP5eu6s
 o933QbhRNcbgpUXXjm8gDKOps4JZfhyL4sd+CJbndwslBjb5Et29IH0XY151kYKK8km+
 mLZNuZI7/6Wf8LZ+LaUamW0So6gmNMhIMxCWsaGeDe/aQ+DQPxQg0a3woUfC6Lj5mXot qg== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by aserp2130.oracle.com with ESMTP id 378jwbk9ar-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 17 Mar 2021 08:31:38 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12H8VOBW098031;
        Wed, 17 Mar 2021 08:31:36 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by userp3020.oracle.com with ESMTP id 37a4eu31kt-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 17 Mar 2021 08:31:36 +0000
Received: from abhmp0018.oracle.com (abhmp0018.oracle.com [141.146.116.24])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 12H8VZXw006167;
        Wed, 17 Mar 2021 08:31:35 GMT
Received: from kadam (/102.36.221.92)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Wed, 17 Mar 2021 01:31:35 -0700
Date:   Wed, 17 Mar 2021 11:31:28 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Junyeong Jeong <esrse.jeong@gmail.com>
Cc:     kernel-janitors@vger.kernel.org
Subject: Re: /sys/devices/system/cpu/possible can be changed during runtime?
Message-ID: <20210317083128.GZ2087@kadam>
References: <87o8fl0yf4.fsf@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87o8fl0yf4.fsf@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-IMR: 1
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9925 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 bulkscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103170064
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9925 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 mlxlogscore=999
 spamscore=0 mlxscore=0 bulkscore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1011 adultscore=0 phishscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103170064
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Mon, Mar 15, 2021 at 02:35:06PM +0900, Junyeong Jeong wrote:
> Hello everyone :D
> 
> I wonder that possible-CPU-mask(/sys/devices/system/cpu/possible) can be
> changed during runtime. I read that it is fixed at boot time, but I am
> not sure that it is really immutable even if some cgroup or
> virtualization magic is used.
> 
> I am referring to /sys/devices/system/cpu/possible file to get to know
> the number of per-cpu areas. In userspace, I call `bpf_lookup_elem()` to
> get values at index from BPF array map of which type is
> BPF_MAP_TYPE_PERCPU_ARRAY.  And the length of the gained values is the
> same with the number of per-cpu areas and in turn it is the same with
> the number of possible CPUs.
> 
> I am anxious that this varies from time to time under some
> circumstances. So I checked some cgroup and virtualization use-cases
> which did not affect the possible-CPU-mask.
> 
> $ docker run --cpuset-cpus=0-3 -it ubuntu:20.10 bash  # cgroup cpuset
> $ virsh setvcpus --current ubuntu20.10 5  # hotplug cpu while guest os is running..
> 
> But while conducting this I realized that it's not possible to prove the
> immutability of possible-CPU-mask using inductive method.
> 
> Can anyone explain that it will not happen that possible-CPU-mask
> changes after boot-time even with cgroup magic or some tricks from
> outside of hypervisors?
> 
> Thanks,

Kernel janitors is mostly about fixing and updating kernel API, not
discussing how the kernel works.

You can't write to that sysfs file.
-r--r--r-- 1 root root 4096 Mar 17 11:28 /sys/devices/system/cpu/possible
But we do allow people to add and remove CPUs while the system is
running (CPU hotplug).  The number of CPUs is not necessarily fixed at
boot time.  It's not immutable.

I'm not sure if this helps?

regards,
dan carpenter
