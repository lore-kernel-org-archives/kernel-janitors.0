Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795788861;
	b=BJRS2EVqbfDbd5FOPlIYLVk8hyREGN4YR35ycJZjjXZNtIk6UwGR33I61RFERYhUHSLD
	 vv9DINVl6e36bEJ99gORkaqMci6D6eTAyS7iroai/Xqnkv9e6njAOqeOP4SUC7Ba7HToa
	 VF/0bwMoRynJ7UGApWmWm33pVM/J1knevkwxamzINmjqUd3NQSsoBnc0bHVRanfO2OUz+
	 o60EE3nB44cXUlapcdowI//PYB5/kD0kuvOp56yKbhqIdYT1372Ng6euk2RgOH4T7nD4l
	 bM20vTMue1+cAaBMru0+ZiQFfEeU4jwE6LzYby0gtaQPbUYj/vH5GaNa4ELeY9q/9zA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795788861;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:Auto-Submitted:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=Ld9+YyGfs/W/wYUchYl+G0tuTdeNOsMW/DqiAiz5bT8=;
	b=coLdQnR70PeX5A2OvGxx7X5PSl+Sd3yaEh9fchlXrji5JulCi5gxgs3c0gJEu+Ba12/4
	 TGutkgccceb8KzqCB2tPqRkN1zCSOCPKFjlbxe0F0p/wcd9xhvJQvWsdyHtgOh5NxfcZ1
	 BOUBiw4k0fK/0+g2FH/fzCVO5iuhkiQazrT6beQZY9byN5Vea+0eZUs51yAaYpH1uhXEs
	 7SNGTt8LHfyxl94PPK6lXztuJIbdUDcwNlCWsRScNavU0Nu8XXNxH5sa9EOOeTvDxk4vC
	 ON3gyw08eBPEjsME8drjw5mkljcnvps2uLhniIia/PPbVe0DSNlMgw9dm//OL1tx1+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=D7BxvgIk;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69F30606A31C;
	Fri, 27 Nov 2026 14:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=D7BxvgIk
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBFE41F0089C;
	Fri, 27 Nov 2026 14:14:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795788860;
	bh=Ld9+YyGfs/W/wYUchYl+G0tuTdeNOsMW/DqiAiz5bT8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=D7BxvgIkaFBMAmzqJdD7TT4+D71V/nGhxpM+/CFMdwSqR2YhJypFyAFVpzXamLKEK
	 osRuiWR5H2T13Mapr2WrU5U5UEqVNx53YNo/3yy5zLs7p44XchA7Uj8pumagOYtUUc
	 O2E4/Lnyz81o2pZ+LM8UXgDzU9WNClii3PvZyzh5vBvbPyo9m/Tj2uHETG0awNL1cn
	 vvsroujG7YKoep+pl0mqKiZXx9i403VtjZhY0CU3kddEfzgloAIjqBZEgzCQIw5e8r
	 6NDEQNEbRAQVn81zc/p+ajBhrbafvZBi3T51cX3eGgwkorxqhAJAYb1hqYoMKkmhLV
	 mPdUx5S8hzuYA==
From: netdev-bot+sinfo@kernel.org
To: Markus Elfring <Markus.Elfring@web.de>
Cc: netdev@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Hemanth Selam <hemanth.selam@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Jonas Gorski <jonas.gorski@gmail.com>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 kernel-janitors@vger.kernel.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Christophe Jaillet <christophe.jaillet@wanadoo.fr>,
 Florian Fainelli <f.fainelli@gmail.com>, Frank Li <Frank.Li@kernel.org>,
 Julia Lawall <Julia.Lawall@inria.fr>
Subject: Re: [PATCH net v2 1/2] bcm63xx_enet: Prevent unbalanced
 clk_disable_unprepare() call in bcm_enet_remove()
Date: Fri, 27 Nov 2026 14:14:19 +0000
Message-ID: <179578885926.3294.10032296145328434498@kernel.org>
In-Reply-To: <0302adc3-dbf2-4e62-ac9b-8923ac285506@web.de>
References: <7d7b20e7-6749-46c4-a6f8-462f83cd27e3@web.de>
 <0302adc3-dbf2-4e62-ac9b-8923ac285506@web.de>
Auto-Submitted: auto-generated
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Post: <mailto:kernel-janitors@vger.kernel.org>
List-Help: <mailto:kernel-janitors+help@vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
List-Owner: <mailto:kernel-janitors+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi!

This is an automated message. This series looks like a fix, but its
commit messages seem to be missing some information:

 - How the issue was discovered, e.g. hit in production, hit during
   development, syzbot report, manual code inspection, LLM or static
   analysis tool scan.

 - Whether the issue was actually triggered, or is only theoretical
   (e.g. found by LLM and not proven at runtime). If it was triggered
   please include the symptoms, like the stack trace or kernel messages.

 - What hardware the change was tested on. For driver fixes please
   mention the device (and if relevant firmware version) used for
   testing, or say that the change was not tested on real hardware.

Please do not repost the series just to address the above. Instead,
reply to this email with the missing information, so that reviewers
can take it into account.

*IMPORTANT*: If you do repost (for other reasons) - please include
the relevant info in the cover letter or commit messages.
-- 
The evaluation is done by an LLM so it may be wrong, if you think
that is the case please reply and explain.
