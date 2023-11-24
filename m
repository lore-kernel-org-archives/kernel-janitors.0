Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="bPXUtVgA"
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 859D826A3;
	Fri, 24 Nov 2023 10:50:00 -0800 (PST)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3AOInp7T082303;
	Fri, 24 Nov 2023 12:49:51 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1700851791;
	bh=N0YVMRCXTOk7PPT1YzjO6mozGzr/3NgvaOoL5ltl/s0=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=bPXUtVgA4hNKku8tewUDThBvBt2PsRfitsZk26eXj7QILUt/IJ4ZzUFeY3N5be3Lv
	 IsO7ry5qDaQcDTbB222RGozAnp4QDlLGqgd772JQVyU5h5cYuJha587NCd3CK9UKMO
	 KoVdpyQUClW9/eS6B1ct3Qf6I1b7xafNJ5vutRyY=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3AOInpXF078255
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 24 Nov 2023 12:49:51 -0600
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 24
 Nov 2023 12:49:50 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 24 Nov 2023 12:49:50 -0600
Received: from localhost (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3AOInogj030861;
	Fri, 24 Nov 2023 12:49:50 -0600
From: Nishanth Menon <nm@ti.com>
To: Tero Kristo <kristo@kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
CC: Nishanth Menon <nm@ti.com>, <linux-kernel@vger.kernel.org>,
        <kernel-janitors@vger.kernel.org>, Tero Kristo <t-kristo@ti.com>,
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v2] firmware: ti_sci: Fix an off-by-one in ti_sci_debugfs_create()
Date: Fri, 24 Nov 2023 12:49:49 -0600
Message-ID: <170085178298.327808.15170603677732456646.b4-ty@ti.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <7158db0a4d7b19855ddd542ec61b666973aad8dc.1698660720.git.christophe.jaillet@wanadoo.fr>
References: <7158db0a4d7b19855ddd542ec61b666973aad8dc.1698660720.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

Hi Christophe JAILLET,

On Mon, 30 Oct 2023 11:12:26 +0100, Christophe JAILLET wrote:
> The ending NULL is not taken into account by strncat(), so switch to
> snprintf() to correctly build 'debug_name'.
> 
> Using snprintf() also makes the code more readable.
> 
> 

I have applied the following to branch ti-drivers-soc-next on [1].
Thank you!

[1/1] firmware: ti_sci: Fix an off-by-one in ti_sci_debugfs_create()
      commit: 964946b88887089f447a9b6a28c39ee97dc76360

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent up the chain during
the next merge window (or sooner if it is a relevant bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/ti/linux.git
-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D

