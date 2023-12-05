Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="NtQ/msW4"
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07ECBA4;
	Tue,  5 Dec 2023 02:24:10 -0800 (PST)
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3B56Q8A4003885;
	Tue, 5 Dec 2023 04:23:55 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=PODMain02222019; bh=GFILbflMqb4o+t6
	fxZdUwYUJfrO+r/2ojDqV/+kX+pk=; b=NtQ/msW4X7zJIyjFJ2vcdi/LlwPn/97
	A6YStkWhrsvRAxXiYD0rEX0xZGzpcLdZTsRlpdtlfVYSRN2yrbCIrcQnz0yg4OD0
	ChW3rcqIOADCQsCrFXn/COAfc7kdnApSLzE0VCGUB3fGHnPW5u4JQ5JjAEC0RvDR
	dA9yhpgvG3pj9QDQMO9gozPkPVxy+a1qwGmFOVrSXWwXptGiycBKiuy2W04BuqPr
	atlDNBzQr2zAZs63J5IqutK6ob9tZpGhFuiN0Ew9B+bjkjDMV1kr5IMRdaDfY2lb
	pmyUYC7FqIPJyr0Qd45OBmMRe3xeL4YZBU+40im+Vn6W7VUgVyXROHw==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3ur1vnk3qr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 05 Dec 2023 04:23:55 -0600 (CST)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Tue, 5 Dec
 2023 10:23:53 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.40 via Frontend Transport; Tue, 5 Dec 2023 10:23:53 +0000
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 723B0474;
	Tue,  5 Dec 2023 10:23:53 +0000 (UTC)
Date: Tue, 5 Dec 2023 10:23:53 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Colin Ian King <colin.i.king@gmail.com>
CC: James Schulman <james.schulman@cirrus.com>,
        David Rhodes
	<david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        <alsa-devel@alsa-project.org>, <patches@opensource.cirrus.com>,
        <linux-sound@vger.kernel.org>, <kernel-janitors@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH][next] ASoC: cs4271: Fix spelling mistake "retrieveing"
 -> "retrieving"
Message-ID: <20231205102353.GD14858@ediswmail.ad.cirrus.com>
References: <20231205101740.2820813-1-colin.i.king@gmail.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231205101740.2820813-1-colin.i.king@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: dNRqLVlZD_1P4znVHVYUKVZ9k8TfL-gn
X-Proofpoint-ORIG-GUID: dNRqLVlZD_1P4znVHVYUKVZ9k8TfL-gn
X-Proofpoint-Spam-Reason: safe

On Tue, Dec 05, 2023 at 10:17:40AM +0000, Colin Ian King wrote:
> There is a spelling mistake in a dev_err_probe error message. Fix it.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
