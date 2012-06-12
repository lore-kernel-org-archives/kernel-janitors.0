From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 12 Jun 2012 18:49:55 +0000
Subject: Re: [Q] Cleaning string whitespace trimming. Does it make any sense?
Message-Id: <20120612184955.GN13539@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <CALF0-+V15wjFhZH5P1C+4sJ9QSw7QY5Rk383S4XhVVCBsnXUQw@mail.gmail.com>
In-Reply-To: <CALF0-+V15wjFhZH5P1C+4sJ9QSw7QY5Rk383S4XhVVCBsnXUQw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

We already have strim() which removes leading and trailing
whitespace.  But sure, that sounds like a good idea.  It would go in
front of strim() and strim would call it first then strim() would
look like this:

char *strim(char *s)
{
	trim_trailing(s);
	return skip_spaces(s);
}

Good luck on getting everyone to agree on a name for your function.
Python uses rstrip() for this.  CC Andrew Morton and lkml when you
have a patch ready.

regards,
dan carpenter

