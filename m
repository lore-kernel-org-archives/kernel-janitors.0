From: Alexei Starovoitov <ast@plumgrid.com>
Date: Tue, 26 May 2015 16:01:25 +0000
Subject: Re: bpf: allow bpf programs to tail-call other bpf programs
Message-Id: <556498D5.9060207@plumgrid.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150523173328.GB31663@mwanda>
In-Reply-To: <20150523173328.GB31663@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 5/23/15 10:33 AM, Dan Carpenter wrote:
> Hello Alexei Starovoitov,
>
> This is a semi-automatic email about new static checker warnings.
>
> The patch 04fd61ab36ec: "bpf: allow bpf programs to tail-call other
> bpf programs" from May 19, 2015, leads to the following Smatch
> complaint:
>
> kernel/bpf/verifier.c:921 check_call()
> 	 error: we previously assumed 'map' could be null (see line 911)
>
> kernel/bpf/verifier.c
>     910	
>     911		if (map && map->map_type = BPF_MAP_TYPE_PROG_ARRAY &&
>                      ^^^
> Patch introduces a check for NULL.
>
>     912		    func_id != BPF_FUNC_tail_call)
>     913			/* prog_array map type needs extra care:
>     914			 * only allow to pass it into bpf_tail_call() for now.
>     915			 * bpf_map_delete_elem() can be allowed in the future,
>     916			 * while bpf_map_update_elem() must only be done via syscall
>     917			 */
>     918			return -EINVAL;
>     919	
>     920		if (func_id = BPF_FUNC_tail_call &&
>     921		    map->map_type != BPF_MAP_TYPE_PROG_ARRAY)
>                      ^^^^^^^^^^^^^
> New unchecked dereference.

that is false positive.
See that 'if (func_id = BPF_FUNC_tail_call ...)' is done before
map->map_type dereference.
tail_call_proto has:
.arg2_type = ARG_CONST_MAP_PTR
so call at line 869:
check_func_arg(env, BPF_REG_2, fn->arg2_type, &map);
will check that arg2 is map_ptr and will assign valid map pointer
into map variable.
So if line 920 is true, then line 869 was ok as well and map
pointer is valid. No need for extra check at line 921.

