Received: from sipsolutions.net (s3.sipsolutions.net [168.119.38.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 496BE283FCF;
	Thu, 26 Feb 2026 20:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=168.119.38.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772138866; cv=none; b=ugOJ1P+QXBDoCNvjK7lsL3c6YXhFZjBpDG9miMYVpN8Zzp3aLITlNfHytovH9agIaBOi4p/MyKFbs5xcGdtXf5/Sy1qgRxVOxtBewiAn9HXIfXDh45rNilnJTGt05s1C7kgAtAiQMKMlniFBnCcuzBWPheMqHOzHpVST4NwREXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772138866; c=relaxed/simple;
	bh=yGqvLmJPcaAOrxNOcjED3+65oW1c2BvUJPz46YCc8tw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=pQC15HfH+z/S1ElL+V/lpwGjxmA/Qxl9O8GjFStH5d4wgA42U+egbrG6r8VdGlR6qBP23kZDTJUk3GdsISQhBxuYV6cYMslJcZt2Zm7XTSqSpldjugOZx/2P75y6yKkolRGBCcN6dFUcC6ZjRGFKazqNdlHKCXEYUIF2rOOirPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sipsolutions.net; spf=pass smtp.mailfrom=sipsolutions.net; dkim=pass (2048-bit key) header.d=sipsolutions.net header.i=@sipsolutions.net header.b=dELycg9+; arc=none smtp.client-ip=168.119.38.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sipsolutions.net header.i=@sipsolutions.net header.b="dELycg9+"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=yGqvLmJPcaAOrxNOcjED3+65oW1c2BvUJPz46YCc8tw=;
	t=1772138865; x=1773348465; b=dELycg9+x3cvLzQRrE8s1wBCM8NwdvJG7FJNpMRA1TH5Eib
	U4f1IbkSxHt+8SqxeKpfKuo0YSvC3rehutyfdORSuYE7TdUVQcTn2laNqUtEIC04Q3nEf10kKR7k0
	+8SP8dUMElqqCGuRA86UMxIoCV/GcPlk2qLnVbTuAYB0YVsTSZKU3vpVatLSKXdW4V4BIm+nFfctF
	AJdzB+1vZ7ySLGegOIR4mzezqhB9ppBdL/ozMSy8KTfysPcyiKudqOmc7PoIQFvWc0gizhsDmKjoT
	OVypnQFJ/3Hvh96B6J+ckZP9QtFGTNocnEwAIlzty+idKs4yfDPDslEKSjN+frEQ==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1vviGq-00000002awX-0FUr;
	Thu, 26 Feb 2026 21:47:40 +0100
Message-ID: <05f10825418c4e8c12b96eaf9404e4e14ad63aaa.camel@sipsolutions.net>
Subject: Re: [PATCH v1] ALSA: aoa: Constify struct configfs_item_operations
 and configfs_group_operations
From: Johannes Berg <johannes@sipsolutions.net>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Jaroslav Kysela
	 <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-sound@vger.kernel.org
Date: Thu, 26 Feb 2026 21:47:38 +0100
In-Reply-To: <803ed3c1a19faab6481f3b3b4bf1eb86739061bd.1772138561.git.christophe.jaillet@wanadoo.fr>
References: 
	<803ed3c1a19faab6481f3b3b4bf1eb86739061bd.1772138561.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-malware-bazaar: not-scanned

On Thu, 2026-02-26 at 21:43 +0100, Christophe JAILLET wrote:
> 'struct codec_connection' are not modified in this driver.
>=20
> Constifying these structures moves some data to a read-only section, so
> increases overall security.
>=20

The security claim seems like a stretch for this data, but I guess since
it's never modified making it const makes some sense.

johannes
