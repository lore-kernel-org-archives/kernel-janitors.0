Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37CD7B664
	for <kernel-janitors@vger.kernel.org>; Mon,  6 Nov 2023 06:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="N1zInv7T"
Received: from mail-0301.mail-europe.com (mail-0301.mail-europe.com [188.165.51.139])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C45E0B6;
	Sun,  5 Nov 2023 22:17:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1699251428; x=1699510628;
	bh=I/NADm3y4JRhxPmSbj3v0umXGT2ZrmOBF5vX4lVtFkA=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=N1zInv7T/pcD6sBuNdVTKrruTrhFcEE2FbHE/yjdtzonYQm0fLTwS2vvsgvvRSj4x
	 vdG7v/grIykNsjEbEoLgA1vCwsmqKLMRNWci2d/GVpHvXHybExbICVHxwRMB7rFjy6
	 fB5+DjF6NB+pjiDkhmStITYfKRUftKht+mLjsTKxQJTrVM3QjsxMVFy9JKdTmS9KyY
	 s4E0yStEKblp8Zr61j5IqRymQz8d8HQnYTdnOO6yh9WLPZSmuhH7MDsr0jGgrqQ57U
	 vQNqd9k8tLeNAhhG7kctPi61o9Y/mHJw2ODxOW5aCnn9APIGV9kCYwThiFMqvJLyfy
	 N4LNPURNHqIZQ==
Date: Mon, 06 Nov 2023 06:16:59 +0000
To: Su Hui <suhui@nfschina.com>
From: Rahul Rameshbabu <sergeantsagara@protonmail.com>
Cc: ping.cheng@wacom.com, jason.gerecke@wacom.com, jikos@kernel.org, benjamin.tissoires@redhat.com, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH v2] HID: wacom_sys: add error code check in wacom_feature_mapping
Message-ID: <87pm0nz9rc.fsf@protonmail.com>
In-Reply-To: <20231106060815.104971-1-suhui@nfschina.com>
References: <20231106060815.104971-1-suhui@nfschina.com>
Feedback-ID: 26003777:user:proton
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Mon, 06 Nov, 2023 14:08:16 +0800 "Su Hui" <suhui@nfschina.com> wrote:
> hid_report_raw_event() can return error code like '-ENOMEM' if
> failed, so check 'ret' to make sure all things work fine.
>
> Signed-off-by: Su Hui <suhui@nfschina.com>
> ---
> v2:
>  - report the returned error (Rahul Rameshbabu) and __func__.

Thanks for the patch. Like the addition of using __func__.

Reviewed-by: Rahul Rameshbabu <sergeantsagara@protonmail.com>

