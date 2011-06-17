From: David Miller <davem@davemloft.net>
Date: Fri, 17 Jun 2011 04:03:48 +0000
Subject: Re: [PATCH] net: icplus: remove unnecessary code
Message-Id: <20110617.000348.1503899534076260015.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1308243870-30203-1-git-send-email-Gregory.Dietsche@cuw.edu>
In-Reply-To: <1308243870-30203-1-git-send-email-Gregory.Dietsche@cuw.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Gregory.Dietsche@cuw.edu
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, peppe.cavallaro@st.com, u.kleine-koenig@pengutronix.de

From: Greg Dietsche <Gregory.Dietsche@cuw.edu>
Date: Thu, 16 Jun 2011 12:04:30 -0500

> Compile tested.
> remove unnecessary code that matches this coccinelle pattern
> 	if (...)
> 		return ret;
> 	return ret;
> 
> Signed-off-by: Greg Dietsche <Gregory.Dietsche@cuw.edu>

Applied.
