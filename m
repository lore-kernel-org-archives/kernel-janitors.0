Received: from out-189.mta1.migadu.com (out-189.mta1.migadu.com [95.215.58.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E66B377624
	for <kernel-janitors@vger.kernel.org>; Thu, 11 Apr 2024 17:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712856681; cv=none; b=bgZTmGbiqFFQdbkdETLGMo+ggP6u0/9qGBgwXTTjKVPbYOsg/n+PLMz+/XTsgqDjoH44APzKkfid7CXOQupGA5wbahg+1Lt2fxsYqALAP3/jWXN1HGTZgzds/LGBQWUfMaY4xwiO13znHXuNINCS8Xo6Vz3/RM988cafcIN2Zr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712856681; c=relaxed/simple;
	bh=l7ZI8uzIiysN7n/n3OmmXdTr87Fd9dl+AysUyhl18y4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GsdO+D9OOUMZMR7j5V8kph4HNuXIQY8NzuneckZkePf1ghOE1yUJEDF2requcqJBe7OeMfCGjlmVVaPVwNp+BWwwKOpGpO1sNBI9qFXvX8NYUvIS3LAq/xBZE8gcld8rp3odvLape7PYOArs5YqYTRE9wRRS9a4o+ByFTwsuDGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Cnor1PAI; arc=none smtp.client-ip=95.215.58.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Cnor1PAI"
Date: Thu, 11 Apr 2024 13:31:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1712856676;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=l7ZI8uzIiysN7n/n3OmmXdTr87Fd9dl+AysUyhl18y4=;
	b=Cnor1PAI6GYyZvMYeXQP/7xrNwv6VxMf4qgeJG/xdMUo/WpZvkbiZYXvtmoTyB/W+whBoo
	qbvE0bK9h5trNI+TWtsoDch4r3NCXeb4aQMnffz6/z7yT7/JPKW0HBqjK83k0Zr8gZOWnb
	frfNoa+N563bg80i0L928kJpSx9se3s=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Kent Overstreet <kent.overstreet@linux.dev>
To: Hongbo Li <lihongbo22@huawei.com>
Cc: Lukas Bulwahn <lbulwahn@redhat.com>, Brian Foster <bfoster@redhat.com>, 
	linux-bcachefs@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: Re: [PATCH] bcachefs: fix typo in reference to BCACHEFS_DEBUG
Message-ID: <w76yialze3mzjmhcdt5guelmsw5ezady4zpn6m7lszluc4u4vg@s3eosgrvhj7w>
References: <20240411082931.56362-1-lukas.bulwahn@redhat.com>
 <a2683fad-07db-4857-9ebf-7adf31a09e50@huawei.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a2683fad-07db-4857-9ebf-7adf31a09e50@huawei.com>
X-Migadu-Flow: FLOW_OUT

On Thu, Apr 11, 2024 at 05:21:05PM +0800, Hongbo Li wrote:
> Also, I am curious why such spelling errors cannot be detected at the
> compilation stage.

code coverage analysis would catch this. I'm one patch away from fully
automated code coverage.
