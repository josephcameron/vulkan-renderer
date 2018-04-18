// © 2018 Joseph Cameron - All Rights Reserved
// Created on 2018-04-16.
#ifndef VKRENDERER_TEXTURE_H
#define VKRENDERER_TEXTURE_H

#include <vulkan/vulkan.h>

#include <string>

namespace vkrenderer
{
///@brief 2d image used to color frags.
///@warning incomplete
class Texture final
{
    // TEMP
public:
    // Context
    VkDevice device; //!< handle to the device owning the vk context this is bound to

    // VRAM handles
    VkDeviceMemory textureImageMemory; //!< handle to texture buffer? handle to a device memory buffer (ie a void ptr)
    VkImage textureImage;              //!< handle to image in memory: applies type to the raw device memory handle

    // shader stage related handles
    VkImageView textureImageView; //!< used by pipeline shaders to access image objects.
    VkSampler textureSampler;     //!< used to read image data and apply filtering and other transformations for the shader

public:
    ///@brief Builds a texture from a file
    ///@param aImageFile path to an image file
    ///@warning incomplete
    Texture(const std::string &aImageFile, VkDevice &device, VkPhysicalDevice &physicalDevice, VkQueue &graphicsQueue, VkCommandPool &commandPool);

    Texture() = delete;

    ~Texture();
};
}

#endif
