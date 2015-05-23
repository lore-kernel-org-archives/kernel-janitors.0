From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 23 May 2015 17:33:28 +0000
Subject: re: bpf: allow bpf programs to tail-call other bpf programs
Message-Id: <20150523173328.GB31663@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Alexei Starovoitov,

This is a semi-automatic email about new static checker warnings.

The patch 04fd61ab36ec: "bpf: allow bpf programs to tail-call other 
bpf programs" from May 19, 2015, leads to the following Smatch 
complaint:

kernel/bpf/verifier.c:921 check_call()
	 error: we previously assumed 'map' could be null (see line 911)

kernel/bpf/verifier.c
   910	
   911		if (map && map->map_type = BPF_MAP_TYPE_PROG_ARRAY &&
                    ^^^
Patch introduces a check for NULL.

   912		    func_id != BPF_FUNC_tail_call)
   913			/* prog_array map type needs extra care:
   914			 * only allow to pass it into bpf_tail_call() for now.
   915			 * bpf_map_delete_elem() can be allowed in the future,
   916			 * while bpf_map_update_elem() must only be done via syscall
   917			 */
   918			return -EINVAL;
   919	
   920		if (func_id = BPF_FUNC_tail_call &&
   921		    map->map_type != BPF_MAP_TYPE_PROG_ARRAY)
                    ^^^^^^^^^^^^^
New unchecked dereference.

   922			/* don't allow any other map type to be passed into
   923			 * bpf_tail_call()

regards,
dan carpenter
