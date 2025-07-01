Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 151D4280A5A
	for <kernel-janitors@vger.kernel.org>; Tue,  1 Jul 2025 14:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.212.143.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751381685; cv=none; b=g+vOgU02my3+GxDsWRhjPXmBHS8i6+So/IUFbBGUu9b2wg9YTr8QI/O3JsOjG9Cv4mwM2MPPiYqIvOD97+ab//o/XXdLAFRpMwfmKePPkdbNqLlTiGGuLY0H2Z1+QK0nH3dYIvf4pvxozyGKL97kR8fMGjR7EU8bQFj6uc5qXW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751381685; c=relaxed/simple;
	bh=7/YHas7kiaE+5ug16qVJuuYmeclhEgE6W86pQfApqwo=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type; b=gEGSZMzSxOw5Hk6QVMYV647Iykk8N6o+9La9blNxebRzj7uUNihw5nOft5uSnSnAjYu4h7VpBp3i1u43L5BUShgGU2lhZhwG6P7NqgdGZSTZXsZVo75yN9e07lkUQW5DqrEGVXyenUd0SQF7xUm289Rh7u4dHOrUQo0zjvwkBiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=crashcourse.ca; spf=pass smtp.mailfrom=crashcourse.ca; dkim=pass (2048-bit key) header.d=crashcourse.ca header.i=@crashcourse.ca header.b=L2gqew37; arc=none smtp.client-ip=199.212.143.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=crashcourse.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crashcourse.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=crashcourse.ca header.i=@crashcourse.ca header.b="L2gqew37"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=H3OAwT5+9QLTj88wluW0zSGiM65qlpJVL1NJ7QJy1Mo=; b=L2gqew37HFPuUwlZDFBfP6sfZk
	gfEoKPBgeHQX63o3Itf5u5UlSy0K46gJuI8BNIBsl6a5vQ5RhP/hsRntofu1/FcRjG6lmNJ9hexme
	BSLf9/VR53b1rvj4a5IjyAQA6vuMo9gY4ShVOlXNSOpe1yuCwM9rfRW9FW50Ml+YSz0p1+DPORBqb
	qGhI1hqVHGxVmRxwpDXAN0G3MCZubVDZ9WGeyocWGs5UEw6chHOYfWBtNgWslCacOqfo63ksFwLjs
	I1wCuzL8TpeOHfOYAz/JTYhojRUGHItUX6Em+mKi8JXOsV2Lti5jZMYJ1QtQRnj6udfYJ0dCw2+By
	j1xKnAng==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:55744 helo=asus)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1uWcNb-000000093jZ-2iAr
	for kernel-janitors@vger.kernel.org;
	Tue, 01 Jul 2025 10:54:40 -0400
Date: Tue, 1 Jul 2025 10:54:33 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Kernel Janitors List <kernel-janitors@vger.kernel.org>
Subject: very small number of "make bad configs" in kernel source
Message-ID: <9deedfb5-bd25-7f8b-ea1b-09781461cc6d@crashcourse.ca>
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


  (one more note before i head out for canada day).

i have a script that identified references to undefined CONFIG_*
variables in Makefiles, but the number of those is so tiny (three)
that i'll just list them here:

===== IWLMVM_AX_SOFTAP_TESTMODE
./drivers/net/wireless/intel/iwlwifi/mld/Makefile:iwlmld-$(CONFIG_IWLMVM_AX_SOFTAP_TESTMODE)
+= ax-softap-testmode.o

===== IWL_VENDOR_CMDS
./drivers/net/wireless/intel/iwlwifi/mld/Makefile:iwlmld-$(CONFIG_IWL_VENDOR_CMDS)
+= vendor-cmd.o

===== SENSORS_SBRMI
./drivers/hwmon/Makefile:obj-$(CONFIG_SENSORS_SBRMI)    += sbrmi.o

  in the three Makefiles above, you can see references to "CONFIG_"
variables that do not appear to be be defined anywhere in the kernel
tree, so anyone interested is invited to examine what's happening in
each case and how to clean it up.

  for that last case, i checked the Git log and if you run:

    $ git show e1565867640506166b6c4182dec9ee955492d003

that's the commit that deletes the definition:

  config SENSORS_SBRMI

so you can do with that what you will; that's just an example of how
stuff like that should be investigated.

rday
