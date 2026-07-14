Received: from ns1.suksangroup.com (ns1.suksangroup.com [103.13.31.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29AF731F984
	for <kernel-janitors@vger.kernel.org>; Tue, 14 Jul 2026 05:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.13.31.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784006604; cv=none; b=chd7wUFJNcTqo8+qfhFFkpWy0D6K6oHzuLy8uVdKS2mXUA61hFzZqRFnlfjvNSE/DmcmJ2p83R+P87mPJfsh740JRHxXhTyanmjpQz0EgZiNWW/Cop/O9oy1Pws3J5r7/5QWGyxgyh1NcXmiPEKN+DwB/t7hhqAYVRcDmYB8oTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784006604; c=relaxed/simple;
	bh=6L43FJJabVfC+oj47issLe6XU1/9f7pRJVcQtD6U9Hg=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=qLz7XhY8F3GDO21kGbdmE7kxc8XZGf5Z16rSiNHpATJQCP8jbkXtHLGPpprOzu/HFPuOr0lf9OjXAou6Km86uFhnew7GWgHw+dY3rIMgMQ+dAPRVp5Zx0f4AlLqCx3fB6K5b24HzSME0A//m9yIlTNho4+6Uew/J8pG0QaIEVPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=inbox.org; spf=fail smtp.mailfrom=inbox.org; dkim=pass (2048-bit key) header.d=suksangroup.co.th header.i=@suksangroup.co.th header.b=n4ppETW3; arc=none smtp.client-ip=103.13.31.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=inbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=inbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suksangroup.co.th header.i=@suksangroup.co.th header.b="n4ppETW3"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=suksangroup.co.th; s=default; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Sender:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=6L43FJJabVfC+oj47issLe6XU1/9f7pRJVcQtD6U9Hg=; b=n4ppETW3+2JrWrz8uz89nLGocZ
	Wu5NjlIM2DEKPGeXhkcS8T3YGaqySjD3Ek2H48qbOyZUgOWMxvzKqgQo5jvFp1iKJfcNbLvYLHWFI
	lvigIIuueYvYejg8htFsCH1heV4mX69bgpkqagg4XMp3ZIZgdZ5CR0kKXC36Ljoabyz7LXccOeyqb
	cAfsXuK57pUXLTH8qN0eZrIkKRgfYDk3YJ1XekWpDc1QhtR/br2+0F/GKunNZj2y1/w3+D0gmClY8
	XOlfUoUfIht2SZ5VCRLIFhKgRuWH8VF6Mf/50i3F7x1o0Gui9KdpxE+E/glYHDqkEGPyGl2fHBX2X
	zUCdnGBw==;
Received: from [207.189.26.187] (port=62966)
	by ns1.suksangroup.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <info@inbox.org>)
	id 1wjVc1-0000000FwVE-40GU
	for kernel-janitors@vger.kernel.org;
	Tue, 14 Jul 2026 12:23:21 +0700
Reply-To: hanns.schofield@lexcapitalgrowth.com
From: Harry Schofield ESQ <info@inbox.org>
To: kernel-janitors@vger.kernel.org
Subject: Dear kernel-janitors, project info
Date: 14 Jul 2026 00:23:17 -0500
Message-ID: <20260714002317.6342B6B111E0D3CD@inbox.org>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - ns1.suksangroup.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - inbox.org
X-Get-Message-Sender-Via: ns1.suksangroup.com: authenticated_id: smtp@suksangroup.co.th
X-Authenticated-Sender: ns1.suksangroup.com: smtp@suksangroup.co.th
X-Source: 
X-Source-Args: 
X-Source-Dir: 


Re:Good day kernel-janitors,

Please let me know if this is best email to send you the project=20
info.

Kind regards,

Harry Schofield, ceMBA


