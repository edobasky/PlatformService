using AutoMapper;
using PlatformService.Dtos;
using PlatformService.Models;

namespace PlatformService.MappingProfile
{
    public class PlatformsProfile : Profile
    {
        public PlatformsProfile()
        {
            // Source to Target
            CreateMap<Platform, PlatformReadDto>();
            CreateMap<PlatformCreateDto,Platform>();
        }
    }
}
 