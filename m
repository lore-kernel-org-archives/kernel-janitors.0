Received: from out30-119.freemail.mail.aliyun.com (out30-119.freemail.mail.aliyun.com [115.124.30.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57EBC271A6D;
	Mon, 15 Dec 2025 01:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.119
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765761182; cv=none; b=oYdCl0X60/WBPWREkc3RVDHEbTVyl55w6G12SCr39XQLURNtOynAxNRV0LReuA4Y4kyhYHqmJ1fRDc+n1sIvoQQWyekdZCdCnUMrmpWx/6LEkJVo2h36P7m1Kby6l/ER8OtcAgBNORtkyDIr9SgKIWHee128O+rHuu/9fTXkXRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765761182; c=relaxed/simple;
	bh=shuchTh16I6/rNq8nzDTt15vL6NDA/OnNNzgXsxNwSc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u1DtIaiUilRq+YLPdeUIoQKtjf/amXzB16cVTEIxgwWDKm0Dz+nUVk1mxu93Vrmjgz5pbIyX4z7v0jDNxY1IZrnR3FpNov1IoJibCoBc/ABiiHYBSO9QDSRzffQq+xQMJC+0HneGeLrcj8YoZ+AJaakkhb+sjoReW46YxpRO4b8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=RbwySmo5; arc=none smtp.client-ip=115.124.30.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="RbwySmo5"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1765761176; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=4YBDbbXQgAxISxzRGxx4IAKs0Ucqa5zP+cWTl3mlV2o=;
	b=RbwySmo5ED59mdSZYqyvaJhdCvAAHCoWYrpE6nmcRPyxfGVYA22rLMvvrlhhUY7Um6H6I+RD8La8bRjO7nlNBN2l2PxYtOZMNqiQEdlrSzSu8X3CkNgwHHtxFffkaCgoBBwk05yf9LQ696nOVXe3oaai6BUGt//wa7ZLEdVdvnc=
Received: from 30.221.145.98(mailfrom:joseph.qi@linux.alibaba.com fp:SMTPD_---0WulLMQ1_1765761175 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 15 Dec 2025 09:12:56 +0800
Message-ID: <40943ae1-1856-4038-bd84-374f28504fad@linux.alibaba.com>
Date: Mon, 15 Dec 2025 09:12:55 +0800
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ocfs2: Constify struct configfs_item_operations and
 configfs_group_operations
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Mark Fasheh <mark@fasheh.com>, Joel Becker <jlbec@evilplan.org>,
 akpm <akpm@linux-foundation.org>, Heming Zhao <heming.zhao@suse.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 ocfs2-devel@lists.linux.dev
References: <7c7c00ba328e5e514d8debee698154039e9640dd.1765708880.git.christophe.jaillet@wanadoo.fr>
From: Joseph Qi <joseph.qi@linux.alibaba.com>
In-Reply-To: <7c7c00ba328e5e514d8debee698154039e9640dd.1765708880.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 2025/12/14 18:41, Christophe JAILLET wrote:
> 'struct configfs_item_operations' and 'configfs_group_operations' are not
> modified in this driver.
> 
> Constifying these structures moves some data to a read-only section, so
> increases overall security, especially when the structure holds some
> function pointers.
> 
> On a x86_64, with allmodconfig, as an example:
> Before:
> ======
>    text	   data	    bss	    dec	    hex	filename
>   74011	  19312	   5280	  98603	  1812b	fs/ocfs2/cluster/heartbeat.o
> 
> After:
> =====
>    text	   data	    bss	    dec	    hex	filename
>   74171	  19152	   5280	  98603	  1812b	fs/ocfs2/cluster/heartbeat.o
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Looks fine.
Acked-by: Joseph Qi <joseph.qi@linux.alibaba.com>

> ---
> Compile tested only.
> 
> This change is possible since commits f2f36500a63b and f7f78098690d.
> ---
>  fs/ocfs2/cluster/heartbeat.c   | 4 ++--
>  fs/ocfs2/cluster/nodemanager.c | 8 ++++----
>  2 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/fs/ocfs2/cluster/heartbeat.c b/fs/ocfs2/cluster/heartbeat.c
> index 724350925aff..8e9cbc334cf4 100644
> --- a/fs/ocfs2/cluster/heartbeat.c
> +++ b/fs/ocfs2/cluster/heartbeat.c
> @@ -1942,7 +1942,7 @@ static struct configfs_attribute *o2hb_region_attrs[] = {
>  	NULL,
>  };
>  
> -static struct configfs_item_operations o2hb_region_item_ops = {
> +static const struct configfs_item_operations o2hb_region_item_ops = {
>  	.release		= o2hb_region_release,
>  };
>  
> @@ -2193,7 +2193,7 @@ static struct configfs_attribute *o2hb_heartbeat_group_attrs[] = {
>  	NULL,
>  };
>  
> -static struct configfs_group_operations o2hb_heartbeat_group_group_ops = {
> +static const struct configfs_group_operations o2hb_heartbeat_group_group_ops = {
>  	.make_item	= o2hb_heartbeat_group_make_item,
>  	.drop_item	= o2hb_heartbeat_group_drop_item,
>  };
> diff --git a/fs/ocfs2/cluster/nodemanager.c b/fs/ocfs2/cluster/nodemanager.c
> index 6bc4e064ace4..c5e83c774d73 100644
> --- a/fs/ocfs2/cluster/nodemanager.c
> +++ b/fs/ocfs2/cluster/nodemanager.c
> @@ -396,7 +396,7 @@ static struct configfs_attribute *o2nm_node_attrs[] = {
>  	NULL,
>  };
>  
> -static struct configfs_item_operations o2nm_node_item_ops = {
> +static const struct configfs_item_operations o2nm_node_item_ops = {
>  	.release		= o2nm_node_release,
>  };
>  
> @@ -638,7 +638,7 @@ static void o2nm_node_group_drop_item(struct config_group *group,
>  	config_item_put(item);
>  }
>  
> -static struct configfs_group_operations o2nm_node_group_group_ops = {
> +static const struct configfs_group_operations o2nm_node_group_group_ops = {
>  	.make_item	= o2nm_node_group_make_item,
>  	.drop_item	= o2nm_node_group_drop_item,
>  };
> @@ -657,7 +657,7 @@ static void o2nm_cluster_release(struct config_item *item)
>  	kfree(cluster);
>  }
>  
> -static struct configfs_item_operations o2nm_cluster_item_ops = {
> +static const struct configfs_item_operations o2nm_cluster_item_ops = {
>  	.release	= o2nm_cluster_release,
>  };
>  
> @@ -741,7 +741,7 @@ static void o2nm_cluster_group_drop_item(struct config_group *group, struct conf
>  	config_item_put(item);
>  }
>  
> -static struct configfs_group_operations o2nm_cluster_group_group_ops = {
> +static const struct configfs_group_operations o2nm_cluster_group_group_ops = {
>  	.make_group	= o2nm_cluster_group_make_group,
>  	.drop_item	= o2nm_cluster_group_drop_item,
>  };

