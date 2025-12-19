Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [62.89.141.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C9443009EC;
	Fri, 19 Dec 2025 10:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.89.141.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766139803; cv=none; b=E2Jk2eLyMvdu9RLikj9WCr0LZQz7EX4UphhXQ1JlZsJhPzKnG4+jJskDcMhMVoiVpLMrCuAkJanyFLGynTOURjSGq7guDLDL8aeHTYqvoXB8mhGZXlN7dnLDG1FYPw1OpqVN5NQjzS4Y+a2VIaATpeC0Qy3TsxaKOIrT9f2j6vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766139803; c=relaxed/simple;
	bh=7/UBfiSjJHCk3d/eClQWxcvtcMLARV3TdPSysrahr/4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nXL/kMMhgMO9Y2USlQmqkHixdKzwBlCSJG72egQzirKFepAvhoqeiQeMriMDq4lL+kpKHGkzumfp1zxki5BrtuyvaP8qCWauDGZN6jmvsStnWcf5uHh/2rYWliVsSCj5FjKbpSpd7tpjRJRBithO30rzcB3p/FwC0IRYj7Mqzzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk; spf=none smtp.mailfrom=ftp.linux.org.uk; dkim=pass (2048-bit key) header.d=linux.org.uk header.i=@linux.org.uk header.b=fIktc7xB; arc=none smtp.client-ip=62.89.141.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ftp.linux.org.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linux.org.uk header.i=@linux.org.uk header.b="fIktc7xB"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=t9Ji2/3IS5K6Tm7mohQ34Rfgo4OLEb7vUfPczENKWY4=; b=fIktc7xB0ykPMsrsS0AKL9dHG+
	ErbB9YOhe6XHpRpIY2GKrwwt4pW9jw0NYD86/zsOTbxIopLHoboF7r2lxOftpItNVx34EYBgxDbRG
	LMVecB3A1I135mYiymFz4GbIVwcaVdbPSAR5s/kI55CsojKbJv++zh7Vtt1ncnPxKhXaAs5o4PKJj
	DQhPJJBzwzOgKJHf6MckUYy8MrntUBB549kJjhNGsqSk3KPlOyg76cai/+eiKzH4rFfKfmr8iujsO
	x3eR4cpy/89f/JB03ZP9dvGWoM/ww+ETpy/rEdcPwR14u5WcsDiQPBQeB5KiwxeP5EUHM5TWId9V6
	lmcYeuqA==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.99 #2 (Red Hat Linux))
	id 1vWXeR-00000003Sto-3rBL;
	Fri, 19 Dec 2025 10:23:59 +0000
Date: Fri, 19 Dec 2025 10:23:59 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: Colin Ian King <colin.i.king@gmail.com>
Cc: Christian Brauner <brauner@kernel.org>, NeilBrown <neil@brown.name>,
	kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] mqueue: remove duplicated ; at end of statement
Message-ID: <20251219102359.GY1712166@ZenIV>
References: <20251219101941.463509-1-colin.i.king@gmail.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251219101941.463509-1-colin.i.king@gmail.com>
Sender: Al Viro <viro@ftp.linux.org.uk>

On Fri, Dec 19, 2025 at 10:19:41AM +0000, Colin Ian King wrote:
> There is a duplicated semicolon at the end of a statement,
> remove it.

FWIW, that's dealt with in the series I've posted lately - see
viro/vfs.git #work.filename, if you prefer to look at it in
git.  I'm going to put that into -next this weekend, assuming nobody
posts objections.
