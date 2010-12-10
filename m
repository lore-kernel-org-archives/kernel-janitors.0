From: David Miller <davem@davemloft.net>
Date: Fri, 10 Dec 2010 22:57:50 +0000
Subject: Re: [PATCH] stmmac: Remove redundant unlikely()
Message-Id: <20101210.145750.58419192.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1291906222-575-1-git-send-email-tklauser@distanz.ch>
In-Reply-To: <1291906222-575-1-git-send-email-tklauser@distanz.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: tklauser@distanz.ch
Cc: peppe.cavallaro@st.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Tobias Klauser <tklauser@distanz.ch>
Date: Thu,  9 Dec 2010 15:50:22 +0100

> IS_ERR() already implies unlikely(), so it can be omitted here.
> 
> Signed-off-by: Tobias Klauser <tklauser@distanz.ch>

Applied.
