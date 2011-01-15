From: =?UTF-8?Q?Sjur_Br=C3=A6ndeland?= <sjurbren@gmail.com>
Date: Sat, 15 Jan 2011 14:03:31 +0000
Subject: Re: [patch] caif: checking the wrong variable
Message-Id: <AANLkTimyZQ1BEJ=tPK4LrYWhQaGd+xhYUsVEENibEVoU@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110115130639.GA2721@bicker>
In-Reply-To: <20110115130639.GA2721@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Dan Carpenter <error27@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

> In the original code we check if (servl = NULL) twice.  The first time
> should print the message that cfmuxl_remove_uplayer() failed and set
> "ret" correctly, but instead it just returns success.  The second check
> should be checking the value of "ret" instead of "servl".
>
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Thank you for spotting and correcting this.
Looks good to me (reviewed only)

Acked-by: Sjur Braendeland <sjur.brandeland@stericsson.com>
