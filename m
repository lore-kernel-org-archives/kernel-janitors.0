From: Johannes Berg <johannes@sipsolutions.net>
Date: Tue, 28 Jun 2016 10:51:17 +0000
Subject: Re: [patch] mac80211: silence an uninitialize variable warning
Message-Id: <1467111077.2493.12.camel@sipsolutions.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160627143118.GB19889@mwanda>
In-Reply-To: <20160627143118.GB19889@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

On Mon, 2016-06-27 at 17:31 +0300, Dan Carpenter wrote:
> We normally return an unitialized value, but no one checks it so it
> doesn't matter.  Anyway, let's silence the static checker warning.
> 

Applied.

johannes
