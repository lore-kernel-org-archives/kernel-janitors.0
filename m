From: Markus Elfring <Markus.Elfring@web.de>
Date: Wed, 03 Jul 2019 08:48:26 +0000
Subject: Re: [PATCH] NFS: Less function calls in show_pnfs()
Message-Id: <ed599239-a6a2-1cc6-14ce-d5bb41e9170f@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <d2f73c3e-a55f-5fb7-a8f8-0dc3ce8ff8a5@web.de>
 <alpine.DEB.2.20.1907031018000.4456@hadrien>
In-Reply-To: <alpine.DEB.2.20.1907031018000.4456@hadrien>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia.lawall@lip6.fr>, linux-nfs@vger.kernel.org
Cc: Anna Schumaker <anna.schumaker@netapp.com>, Trond Myklebust <trond.myklebust@hammerspace.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

>> +++ b/fs/nfs/super.c
>> @@ -749,11 +749,10 @@ static void show_sessions(struct seq_file *m, struct nfs_server *server) {}
>>  #ifdef CONFIG_NFS_V4_1
>>  static void show_pnfs(struct seq_file *m, struct nfs_server *server)
>>  {
>> -	seq_printf(m, ",pnfs=");
>> -	if (server->pnfs_curr_ld)
>> -		seq_printf(m, "%s", server->pnfs_curr_ld->name);
>> -	else
>> -		seq_printf(m, "not configured");
>> +	seq_printf(m, ",pnfs=%s",
>> +		   server->pnfs_curr_ld
>> +		   ? server->pnfs_curr_ld->name
>> +		   : "not configured");
>
> Unreadable.

* Do you find any other source code formatting more readable
  for the usage of the ternary operator?

* How do you think about the general software transformation possibility
  (at this place)?

Regards,
Markus
