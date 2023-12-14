module LinksHelper
    def create_slug()
        minus = ('a'..'z').to_a
        mayus = ('A'..'Z').to_a
        nums = ['1','2','3','4','5','6','7','8','9','0']
        chars = minus + mayus + nums
        res = ""
        for i in 1..8 do
            res.concat(chars[rand(0..chars.size-1)])
        end
        res
    end

    def generate_link(slug)
        public_link_url(slug: slug)
    end
end
