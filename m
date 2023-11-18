Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="frL2RVUH"
Received: from mout.web.de (mout.web.de [212.227.17.12])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92AB1E0;
	Sat, 18 Nov 2023 08:42:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
	t=1700325749; x=1700930549; i=markus.elfring@web.de;
	bh=CQBpc2vh9HQN4tT9nBoNJyRogzGDAx/e4sULPoZDeuk=;
	h=X-UI-Sender-Class:Date:To:Cc:References:Subject:From:
	 In-Reply-To;
	b=frL2RVUHGroASYsDu/y5flARqFEwOJqkvkJ9tsk6acef23d15e1nO99k8JOIJH5m
	 LOxulL+R1EteiLOukKDk2JAwPy2o0Z6ZQE9Zh2jPanw0Y8V5eAuy3AdHFVjNOBbaK
	 /jpIUfJcM2ekPQFivRUbSc6op3ZyXKeTRZSNSH2nTTMPjDJmQiieGHGrv2426erU7
	 LfmtaQMLz/zv2f6gUTj9c8i1MFTcNHcGjz42t2rIUOyXPzkwVKxqVXKeuDsKppycs
	 LYOWoIGVD/C+Sw7IwfIctUC2+tvXqkQzaoUKsSHdzJHity4jvxNDSlwigjd15bYsz
	 S8R96L9jd0+/MSF6pg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.90.95]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MT7aP-1qvDAZ3vVX-00UUfW; Sat, 18
 Nov 2023 17:42:28 +0100
Message-ID: <233689d7-9409-406b-9383-49f10cd29336@web.de>
Date: Sat, 18 Nov 2023 17:42:17 +0100
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 kernel@pengutronix.de, kernel-janitors@vger.kernel.org
Cc: linux-spi@vger.kernel.org, cocci@inria.fr, Mark Brown
 <broonie@kernel.org>, LKML <linux-kernel@vger.kernel.org>
References: <20231105143932.3722920-2-u.kleine-koenig@pengutronix.de>
Subject: Re: spi: cadence-xspi: Drop useless assignment to NULL
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20231105143932.3722920-2-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:bimAwo914tI/X7jy3HV2tL/5MPVU1BNa4SCoqSybb64c+rPbbsI
 SByJoeECEnNN1URSLDPoKC/BGG2YSZMUXKTXd9xVaa2HF3Vfcx5sBHmeUpKQ0empNsyiv0+
 ltukrsnPmCU6/+sDaqnWL7K/Rs1iav0bVjmXpDvqe5pmOLtqYellfPbjw67hlFQWAmMXN+c
 avsiPLS9a8gclWluAshCA==
UI-OutboundReport: notjunk:1;M01:P0:WRbWlSPQY2w=;Y0bpqMauiBxhaSAbtbiw32FYtdn
 n994UDAYWifH64OcNjZk+GR1tphkCF1wqMUtq84HzT0FuWdN8k1CPJqBp6Pq6ggGV0lVuahEc
 YR8hW6uEhky04OpnwbsioOC5vpUZdPItzmPkkYUKjt1epAp9cCOWplh69zVNHftoW6W/ff7Gb
 +V7/eMwMLiAod8o3Qj8b4NLIUwgvQf8jqYcdR3yxZMWX+2KkOnUQP31nKwqqosoKlrtk9DlqU
 /5LkD7IfdJIyDdJ6BwUgGEQVAGhCRoObo57eCtfOWXX2y4iOcpkLSM/1zDesvekBbtmY9t5cI
 kMNUKEUfJeWttp1G83Xg/Xsn9gtPoD3cthk2jujK5wNtFRn8V8qRgUld8furelTugBl+kLTRL
 DHyj4ntSeEa9TjbN057p15BDpXB2w4SFm4iHYthYGA3dpNvQY1+gXzULkJak02jXq0JmGaFIg
 t89CPS9tVo12XnF+J0HRgKRdQd3dDP7mVG4SEwpRYoJh9UfiVh/FA2uD57XvUOlpO+a3abv7e
 QB9xJOVb7ykahfAbqZf/3GdgCgXjAkQz90wvSx/g6TOR64KY2aRHvb/Q3/ic4INz+JTbLEIhc
 Y49x5/kqN9KIdguU9wBE0LLUMgW4zH6B/aCSKMq/qVIlHbZ0YInSPt7JSmtJDr2WzHtxXA4Q0
 QJrwI70vP8uTO6X94jkpryUrtaorwCNhGSWtOnDL/0wcZ41zxLT+QkxK76IrYVEueli5b0OK8
 75jC2spBa2xudNQlXPgtMQs7AvC33Fy5uHXIwtLlhTcsl9gHrdWv4b4fvJKRsNN7mx2Zh8QYO
 D6aS0m6hQFFb78FciLO9LMYc+l1nHxbNMH+M9SEVLuhgA1TrR+AYbepWBK7yC3gJQ2uP7T2UJ
 gtU0ESR5NAxrF4LUOK8ChqmCx8e3xWOLwoh07CpMvf1THXBe8ZT+l6KCq86yNIOaTWvm+VGSF
 0mAVGw==

> Static structs are initialized with zeros for unspecified fields.
> So there is no advantage to explicitly initialize .remove with NULL
> and the assignment can be dropped without side effects.

Would you become interested to delete redundant initialisation repetitions
at any more source code places?

A corresponding script for the semantic patch language (Coccinelle software)
can point more remaining update candidates out for various components.

Regards,
Markus
