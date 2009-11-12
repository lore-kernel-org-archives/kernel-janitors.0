From: James Morris <jmorris@namei.org>
Date: Thu, 12 Nov 2009 21:41:26 +0000
Subject: Re: [PATCH 3/4] security/selinux: decrement sizeof size in strncmp
Message-Id: <alpine.LRH.2.00.0911130833220.5497@tundra.namei.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0911120849050.16627@ask.diku.dk> <alpine.LRH.2.00.0911121857110.31071@tundra.namei.org> <20091112145314.GA24682@us.ibm.com> <Pine.LNX.4.64.0911121556390.19779@ask.diku.dk> <4AFC3620.2020809@schaufler-ca.com>
In-Reply-To: <4AFC3620.2020809@schaufler-ca.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Casey Schaufler <casey@schaufler-ca.com>
Cc: Julia Lawall <julia@diku.dk>, "Serge E. Hallyn" <serue@us.ibm.com>, Stephen Smalley <sds@tycho.nsa.gov>, Eric Paris <eparis@parisplace.org>, linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, 12 Nov 2009, Casey Schaufler wrote:

> I strongly suggest that this is not what is wanted.
>     strcmp(x,y)
> and
>     strncmp(x,y,sizeof(y))
> 
> are functionally equivalent and strcmp has a bad reputation in
> the security community because it is associated with potential
> buffer overrun issues.

Do you see potential for a buffer overrun in this case?

The strings being compared are "sysfs" and the name field of 'struct 
file_system_type'.  The kernel code elsewhere assumes the latter string to 
be a valid zero-terminated string, and we should, too.


- James
-- 
James Morris
<jmorris@namei.org>
