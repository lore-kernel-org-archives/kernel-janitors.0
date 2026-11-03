Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.95.11.211
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793683858;
	b=zTxGBDobJp2boi4tjUjc8tfYXbJd7xxfaXzOfWQqDu7ubc8YryGnCRS491tamN/rT9B7
	 vG5nRLvDM4euHT8xwlxkq0dN66Fb67M7Nh3zx2bw8hTau/3mBmKZgU67uakXchENurgwl
	 KRCh7MSVSEc/bUZlvpG6WLLmIlXoEdfPpKvnwl3Hx5fLDvhG7T6Q7R4BW4Y0gFR7HCxf8
	 SDTTon22vixPfT00GQmccGOduLCaxZFlLWNgYu57v0bTEsQNqpOwRHciFn9n0Y9QHOCGY
	 OpKvc3YrpINZwaMGLjIa2gackn2bRIVFmlRvAh3TjtDE4jHB7lPVZMylTCy2NzE0TFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793683858;
	h=DMARC-Filter:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=M7NmYC/Iylm9myghHwqILim55SAUt9QrM+UZYk0eJlw=;
	b=3ZvjXrOROzA+kB3V2QJC2YWdZO7XGeAo7m6Lz4iUq07Y8cEmaz5eE+MA7kNFqGq7Oqo8
	 ecz7YrwrcPct4guJEfTW4+AwQ1oE7Z+j0iTcNf0ocSa76IxhV/E9+iI1HDL6fPgE4bILg
	 LjX1/yb/B3s3qz9L2sOMmefxfew+DM06iVEBkmP9Xnr4G5QiOsrpkToL4cSB6QI6DKiqK
	 BKJLs9vSi1DOYQeiWHuTapnk7jVMViKnn+uSgUReddvXtlqSY63f31Fs1k88u3+4PqFgW
	 /p8qbAILU/Snhpp3vNqeJB4VqpO0cMvrYmqtCUiLW4ciPYWp5K84eKu/l2gZVlUzT6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lst.de;
	spf=pass smtp.mailfrom=lst.de;
	arc=none smtp.remote-ip=213.95.11.211
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE444606A324;
	Tue,  3 Nov 2026 05:30:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE444606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id C46D268AFE; Tue,  3 Nov 2026 06:30:53 +0100 (CET)
Date: Tue, 3 Nov 2026 06:30:53 +0100
From: Christoph Hellwig <hch@lst.de>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
	Chaitanya Kulkarni <kch@nvidia.com>, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org, linux-nvme@lists.infradead.org
Subject: Re: [PATCH] nvmet: pci-epf: Constify struct pci_epf_ops
Message-ID: <20261103053053.GC1184@lst.de>
References: <3e4d3ffc4e3ec822759782afbaac1279c4a83135.1793482573.git.christophe.jaillet@wanadoo.fr>
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Post: <mailto:kernel-janitors@vger.kernel.org>
List-Help: <mailto:kernel-janitors+help@vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
List-Owner: <mailto:kernel-janitors+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3e4d3ffc4e3ec822759782afbaac1279c4a83135.1793482573.git.christophe.jaillet@wanadoo.fr>
User-Agent: Mutt/1.5.17 (2007-11-01)

Looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>

