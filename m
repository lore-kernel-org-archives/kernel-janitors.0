Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED584289E06
	for <kernel-janitors@vger.kernel.org>; Tue, 29 Jul 2025 12:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.212.143.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753792057; cv=none; b=d7/aHGI9Rx3Ju5OFbPZgPqI+Jo+ZUOBpqesKnkuHAehmP6a49+sCPbTdzBg+4VxS0lT21t6CHSy5LlqsDxNyA9z5Zusmij3v0CqNDSsjL74L5Yd4C0YR+NRnPkwaa83uEZ1vdpO+eYaZsILf5jlR91rSaYHZ3xF+0yJoSu5zVzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753792057; c=relaxed/simple;
	bh=pDp3ZapBP56aS2hvAf0o7RGNnZrvBlc2naQJ+NtCoMU=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type; b=RFfvc8oHl/SyTVX9/8FnkyDt4UtFcfiWGSVDAsu5cJCkVO1ue9JGwBI7v25DI1BgqoPeb2Kj2AazH+E0X7pameJU4FfZO4vndxhgZIlcN7rsnaLjNjTqObq+z0aQCB61bsOxuGVo7JhykEAWr4BXjSFi8ZbY1BJav1qxr+VDowE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=crashcourse.ca; spf=pass smtp.mailfrom=crashcourse.ca; dkim=pass (2048-bit key) header.d=crashcourse.ca header.i=@crashcourse.ca header.b=gM2mcw67; arc=none smtp.client-ip=199.212.143.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=crashcourse.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crashcourse.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=crashcourse.ca header.i=@crashcourse.ca header.b="gM2mcw67"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=NPShgVVZo1GIOR1E0799G06I9qRSPAcg6v2jFtO/Q/o=; b=gM2mcw67Ij9kkQQgNhOsaPeauY
	Q35/NLRfM34cM+jd0vmvssTJj3JPdHUJcmXuY+ETHxXzsiA9zaERNe3N/tsf2Ty4TNbuctQglMJNq
	WSSEWGNPtwhEkBPi+zI1xvo/JpSvxrgUv+szyPmk5VvdNEwXVs40kH9V2C7krSqkTBHoe7LbS0YqS
	EOTpan2qbe7QVw6Ydc9CN3j4G+TL+NRgdDnM7lPw9LTq8EwhVIX4ECjTQpLX7EDK6DnK04jjEB+7B
	3BUfaelWzbUvu0PQ8O69/3uz6eCVwgDEgUtRG+jRN9qy7NHaeV50ECCY3e6ptenybwweCGCdpRQv1
	1TFg1lAA==;
Received: from pool-174-114-102-5.cpe.net.cable.rogers.com ([174.114.102.5]:33954 helo=asus)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1ugjQR-0000000G35r-3oZg
	for kernel-janitors@vger.kernel.org;
	Tue, 29 Jul 2025 08:27:26 -0400
Date: Tue, 29 Jul 2025 08:27:18 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Kernel Janitors List <kernel-janitors@vger.kernel.org>
Subject: more janitorial work: test for power of 2
Message-ID: <e4d1b54c-a5e7-77ee-5314-0017ab8cae5b@crashcourse.ca>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel10.indieserve.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel10.indieserve.net: authenticated_id: rpjday+crashcourse.ca/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: cpanel10.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 


  i mentioned this before but here's something that can be split over
numerous subsystems so it can be done in bite-size pieces -- testing
if an integer is a power of 2.

  the basic test is simple: do a bitwise "and" between n and n-1, and
if the result is zero, n must be a power of 2 (it is left as an
exercise for the reader to convince themselves of that).  the script i
used years ago was pretty simplistic and tested for different
variations that included parentheses or not (so it's entirely possible
the results are not perfect), but here's the script:

  DIR=${1-*}

  echo "PATTERN:     x & (x - 1):\n"
  grep -Ern "([^\(\)]+) ?\& ?\(\1 ?- ?1\)" ${DIR}
  echo "PATTERN:     x & ((x) - 1):\n"
  grep -Ern "([^\(\)]+) ?\& ?\(\(\1\) ?- ?1\)" ${DIR}
  echo "PATTERN:     (x) & (x - 1):\n"
  grep -Ern "\(([^\(\)]+)\) ?\& ?\(\1 ?- ?1\)" ${DIR}
  echo "PATTERN:     (x) & ((x) - 1):\n"
  grep -Ern "\(([^\(\)]+)\) ?\& ?\(\(\1\) ?- ?1\)" ${DIR}

from the top of the kernel source tree, you can run the script and
pass as the argument the directory you want to scan; for example:

=== start

$ test_for_power_of_2.sh drivers/net/ethernet/mellanox
PATTERN:     x & (x - 1):

drivers/net/ethernet/mellanox/mlx5/core/lib/dm.c:163:	if (!length ||
(length & (length - 1)) ||
drivers/net/ethernet/mellanox/mlx5/core/steering/hws/definer.c:691:
if (flags & (flags - 1))
drivers/net/ethernet/mellanox/mlx5/core/steering/hws/definer.c:697:
if (flags & (flags - 1))
drivers/net/ethernet/mellanox/mlx5/core/steering/hws/definer.c:702:
if (flags & (flags - 1))
drivers/net/ethernet/mellanox/mlx5/core/steering/hws/definer.c:709:
if (flags & (flags - 1))
drivers/net/ethernet/mellanox/mlx5/core/steering/sws/dr_rule.c:680:
byte_mask = byte_mask & (byte_mask - 1);
PATTERN:     x & ((x) - 1):

PATTERN:     (x) & (x - 1):

PATTERN:     (x) & ((x) - 1):

=== end

  you can see the official kernel test for power-of-2 here:

https://github.com/torvalds/linux/blob/master/include/linux/log2.h#L36

so there is a *lot* of kernel code that can be simplified by using
that boolean function.

rday

